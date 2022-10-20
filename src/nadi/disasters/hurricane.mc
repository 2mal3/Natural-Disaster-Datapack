import ../../../macros/log.mcm


## API hooks
dir api {
  function register {
    function nadi:api/v1/register
    scoreboard players operation $hurricane nadi.hurricane = .out0 nadi.data
  }

  function select {
    execute if score .out0 nadi.data = $hurricane nadi.hurricane run function nadi:disasters/hurricane/api/start
  }

  # Starts the natural disaster only if it is not yet active
  function start {
    execute if score %active nadi.hurricane matches 0 run function nadi:disasters/hurricane/start
  }

  function install {
    scoreboard objectives add nadi.hurricane dummy

    scoreboard players set %time nadi.hurricane 0
    scoreboard players set %active nadi.hurricane 0

    scoreboard players set $enabled nadi.hurricane 1
    scoreboard players set $minTime nadi.hurricane 10
    scoreboard players set $maxTime nadi.hurricane 15
  }

  function uninstall {
    scoreboard objectives remove nadi.hurricane
  }
}


## Disaster
function start {
  log NaturalDisaster info server <Start hurricane>
  scoreboard players set %active nadi.hurricane 1
  scoreboard players set %disasterActive nadi.data 1

  scoreboard players operation .in0 nadi.data = $minTime nadi.hurricane
  scoreboard players operation .in1 nadi.data = $maxTime nadi.hurricane
  function nadi:utilities/random
  scoreboard players operation %time nadi.hurricane = .out0 nadi.data

  weather thunder 999999
  # Place the hurricane near an player
  # 817a5b73-5e97-42ba-acea-796462e8eb9c
  execute as @r[gamemode=!spectator,predicate=nadi:utilities/in_overworld] at @s run {
    summon minecraft:wandering_trader ~ ~ ~ {Silent: 1b, Invulnerable: 1b, PersistenceRequired: 1b, Offers: {}, UUID: [I; -2122687629, 1586971322, -1393919644, 1659431836], Tags: ["nadi.hurricane"]}
    spreadplayers ~ ~ 0 64 false 817a5b73-5e97-42ba-acea-796462e8eb9c
  }

  # Start clocks
  schedule function nadi:disasters/hurricane/clock/minute 60s replace
  schedule function nadi:disasters/hurricane/clock/10_second 10s replace
  schedule function nadi:disasters/hurricane/clock/second 1s replace
  schedule function nadi:disasters/hurricane/clock/tick_ 1t replace
}

function stop {
  log NaturalDisaster info server <Stop hurricane>
  scoreboard players set %active nadi.hurricane 0
  scoreboard players set %disasterActive nadi.data 0

  scoreboard players set %time nadi.hurricane 0

  weather clear
  kill @e[type=minecraft:falling_block]
  # Remove wandering trader
  kill 817a5b73-5e97-42ba-acea-796462e8eb9c

  # Stop clocks
  schedule clear nadi:disasters/hurricane/clock/minute
  schedule clear nadi:disasters/hurricane/clock/10_second
  schedule clear nadi:disasters/hurricane/clock/second
  schedule clear nadi:disasters/hurricane/clock/tick_
}


function convert {
  setblock ~ ~ ~ minecraft:air destroy
  summon minecraft:falling_block ~ ~1 ~ {Tags: [nadi.init, nadi.block], NoGravity: 1b}
  execute as @e[type=minecraft:falling_block,tag=nadi.block,tag=nadi.init] run {
    tag @s remove nadi.init

    data modify entity @s BlockState.Name set from entity @e[type=minecraft:item,limit=1,sort=nearest] Item.id
    kill @e[type=minecraft:item,limit=1,sort=nearest]

    # Shortly teleport the block outside of the render distance of the player to refresh the texture of the block
    execute at @s run tp @s ~1000 ~ ~
    execute at @s run tp @s ~-1000 ~ ~
  }
}

function random_motion {
  tag @s add nadi.hurricane.ignore

  # x speed from -1.5 to +1.5
  scoreboard players set .in0 nadi.data -150
  scoreboard players set .in1 nadi.data 150
  function nadi:utilities/random
  execute store result entity @s Motion[0] double 0.01 run scoreboard players get .out0 nadi.data
  # y speed from -0.5 to +1.15
  scoreboard players set .in0 nadi.data -50
  scoreboard players set .in1 nadi.data 150
  function nadi:utilities/random
  execute store result entity @s Motion[1] double 0.01 run scoreboard players get .out0 nadi.data
  # z speed from -1.5 to +1.5
  scoreboard players set .in0 nadi.data -150
  scoreboard players set .in1 nadi.data 150
  function nadi:utilities/random
  execute store result entity @s Motion[2] double 0.01 run scoreboard players get .out0 nadi.data

  data merge entity @s {NoGravity: 0b, Time: 1, HurtEntities: 1b, FallHurtMax: 40, FallHurtAmount: 0.05f}
}


# Clocks
dir clock {
  function tick_ {
    schedule function $block 1t replace

    execute as 817a5b73-5e97-42ba-acea-796462e8eb9c at @s run {
      function nadi:disasters/hurricane/particle

      execute as @e[distance=..42,tag=!nadi.hurricane,team=!thisTeamDoesNotExists] at @s run {
        # Mover every entity in a spiral pattern to the center of the hurricane
        execute facing entity 817a5b73-5e97-42ba-acea-796462e8eb9c eyes run tp @s ^-0.3 ^0.1 ^

        # Damages entities in the center of the hurricane
        execute positioned ~-2 ~ ~-2 if entity @e[type=minecraft:wandering_trader,tag=nadi.hurricane,dx=4,dy=-50,dz=4] run effect give @s minecraft:wither 1 1 true
        # Prevent entities from falling down
        effect give @s minecraft:levitation 1 255 true
      }

      execute as @e[type=minecraft:falling_block,tag=!nadi.hurricane.ignore,distance=..64] at @s run {
        execute facing entity 817a5b73-5e97-42ba-acea-796462e8eb9c eyes run tp @s ^-0.3 ^0.2 ^
        # Shoots the block away if it reaches the center of the hurricane
        execute if predicate nadi:utilities/random/20 positioned ~-1 ~ ~-1 if entity @e[type=minecraft:wandering_trader,tag=nadi.hurricane,dx=4,dy=-50,dz=4] run function nadi:disasters/hurricane/random_motion
      }
    }

    # Airtoggle tha falling blocks so they move visually smoothly
    execute as @e[type=minecraft:falling_block,tag=nadi.block] store result entity @s Air int 1 run time query gametime
  }

  function second {
    schedule function $block 1s replace

    execute as 817a5b73-5e97-42ba-acea-796462e8eb9c at @s run {
      # Pick up blocks from the ground
      LOOP(10) {
        summon minecraft:marker ~ ~ ~ {Tags: ["nadi.hurricane"]}
      }
      spreadplayers ~ ~ 1 24 false @e[type=minecraft:marker,tag=nadi.hurricane]
      execute as @e[type=minecraft:marker,tag=nadi.hurricane] at @s positioned ~ ~-1 ~ run {
        function nadi:disasters/hurricane/convert
        kill @s
      }

      # Randomly explode blocks nearby
      execute if predicate nadi:utilities/random/20 run {
        # bfca680d-0b62-4c8a-b1dc-360bb83a8d3b
        summon minecraft:marker ~ ~ ~ {UUID: [I; -1077254131, 190991498, -1310968309, -1204122309]}
        spreadplayers ~ ~ 0 32 false bfca680d-0b62-4c8a-b1dc-360bb83a8d3b
        execute as bfca680d-0b62-4c8a-b1dc-360bb83a8d3b at @s run {
          summon minecraft:creeper ~ ~ ~ {Fuse: 0}
          kill @s
        }
      }
    }
  }

  function 10_second {
    schedule function $block 10s replace

    # Set the target location of the wandering trader (hurricane) to a random block near the nearest player
    execute as 817a5b73-5e97-42ba-acea-796462e8eb9c at @s run {
      execute as @p[gamemode=!spectator] at @s run {
        # 8b57b450-4efe-4efe-8573-6f0595e45446
        summon minecraft:marker ~ ~ ~ {UUID: [I; -1957186480, 1325289214, -2056032507, -1780198330]}
        spreadplayers ~ ~ 0 32 false 8b57b450-4efe-4efe-8573-6f0595e45446
      }

      data modify entity @s WanderTarget.X set from entity 8b57b450-4efe-4efe-8573-6f0595e45446 Pos[0]
      data modify entity @s WanderTarget.Y set from entity 8b57b450-4efe-4efe-8573-6f0595e45446 Pos[1]
      data modify entity @s WanderTarget.Z set from entity 8b57b450-4efe-4efe-8573-6f0595e45446 Pos[2]
    }
  }

  function minute {
    schedule function $block 60s replace

    # Count time
    scoreboard players remove %time nadi.hurricane 1
    execute if score %time nadi.hurricane matches 0 run function nadi:disasters/hurricane/stop
  }
}

function particle {
  #Particles Generated with: Cloud Wolf's Particle Grapher
  # x: t*sin(20*t)/1.5 * (r/1.8)
  # y: t*2
  # z: t*sin(20*t)/1.5 * (r/1.8)
  # Points: 217
  particle sweep_attack ^0.000 ^0.000 ^0.000 0 0 0 0 1 force @a
  particle sweep_attack ^0.048 ^0.184 ^-0.013 0 0 0 0 1 force @a
  particle sweep_attack ^-0.029 ^0.369 ^-0.048 0 0 0 0 1 force @a
  particle sweep_attack ^-0.137 ^0.553 ^0.146 0 0 0 0 1 force @a
  particle sweep_attack ^0.116 ^0.737 ^0.061 0 0 0 0 1 force @a
  particle sweep_attack ^0.021 ^0.922 ^-0.099 0 0 0 0 1 force @a
  particle sweep_attack ^-0.302 ^1.106 ^0.019 0 0 0 0 1 force @a
  particle sweep_attack ^0.023 ^1.290 ^0.065 0 0 0 0 1 force @a
  particle sweep_attack ^0.468 ^1.475 ^-0.327 0 0 0 0 1 force @a
  particle sweep_attack ^-0.247 ^1.659 ^-0.203 0 0 0 0 1 force @a
  particle sweep_attack ^-0.173 ^1.843 ^0.390 0 0 0 0 1 force @a
  particle sweep_attack ^0.691 ^2.028 ^0.100 0 0 0 0 1 force @a
  particle sweep_attack ^-0.111 ^2.212 ^-0.861 0 0 0 0 1 force @a
  particle sweep_attack ^-0.821 ^2.396 ^0.348 0 0 0 0 1 force @a
  particle sweep_attack ^0.525 ^2.581 ^0.657 0 0 0 0 1 force @a
  particle sweep_attack ^0.641 ^2.765 ^-0.889 0 0 0 0 1 force @a
  particle sweep_attack ^-0.113 ^2.949 ^-0.041 0 0 0 0 1 force @a
  particle sweep_attack ^-0.077 ^3.134 ^0.972 0 0 0 0 1 force @a
  particle sweep_attack ^1.049 ^3.318 ^-0.205 0 0 0 0 1 force @a
  particle sweep_attack ^-0.079 ^3.502 ^-0.156 0 0 0 0 1 force @a
  particle sweep_attack ^-0.409 ^3.687 ^0.372 0 0 0 0 1 force @a
  particle sweep_attack ^0.255 ^3.871 ^0.160 0 0 0 0 1 force @a
  particle sweep_attack ^0.151 ^4.055 ^-0.511 0 0 0 0 1 force @a
  particle sweep_attack ^-0.377 ^4.240 ^-0.006 0 0 0 0 1 force @a
  particle sweep_attack ^0.125 ^4.424 ^0.475 0 0 0 0 1 force @a
  particle sweep_attack ^1.016 ^4.608 ^-0.595 0 0 0 0 1 force @a
  particle sweep_attack ^-0.913 ^4.793 ^-0.882 0 0 0 0 1 force @a
  particle sweep_attack ^-0.009 ^4.977 ^0.016 0 0 0 0 1 force @a
  particle sweep_attack ^1.351 ^5.161 ^0.307 0 0 0 0 1 force @a
  particle sweep_attack ^-0.077 ^5.346 ^-1.562 0 0 0 0 1 force @a
  particle sweep_attack ^-2.099 ^5.530 ^0.699 0 0 0 0 1 force @a
  particle sweep_attack ^0.148 ^5.714 ^0.219 0 0 0 0 1 force @a
  particle sweep_attack ^0.007 ^5.899 ^-0.008 0 0 0 0 1 force @a
  particle sweep_attack ^-1.934 ^6.083 ^-0.891 0 0 0 0 1 force @a
  particle sweep_attack ^-0.066 ^6.267 ^0.413 0 0 0 0 1 force @a
  particle sweep_attack ^0.024 ^6.452 ^-0.003 0 0 0 0 1 force @a
  particle sweep_attack ^-0.222 ^6.636 ^-0.546 0 0 0 0 1 force @a
  particle sweep_attack ^-1.388 ^6.820 ^1.074 0 0 0 0 1 force @a
  particle sweep_attack ^0.812 ^7.005 ^0.604 0 0 0 0 1 force @a
  particle sweep_attack ^0.239 ^7.189 ^-0.621 0 0 0 0 1 force @a
  particle sweep_attack ^-1.033 ^7.373 ^-0.098 0 0 0 0 1 force @a
  particle sweep_attack ^0.243 ^7.558 ^1.350 0 0 0 0 1 force @a
  particle sweep_attack ^2.117 ^7.742 ^-1.023 0 0 0 0 1 force @a
  particle sweep_attack ^-1.369 ^7.926 ^-1.552 0 0 0 0 1 force @a
  particle sweep_attack ^-0.915 ^8.111 ^1.411 0 0 0 0 1 force @a
  particle sweep_attack ^1.818 ^8.295 ^0.568 0 0 0 0 1 force @a
  particle sweep_attack ^0.036 ^8.479 ^-1.193 0 0 0 0 1 force @a
  particle sweep_attack ^-1.589 ^8.664 ^0.392 0 0 0 0 1 force @a
  particle sweep_attack ^1.411 ^8.848 ^2.496 0 0 0 0 1 force @a
  particle sweep_attack ^2.338 ^9.032 ^-2.346 0 0 0 0 1 force @a
  particle sweep_attack ^-0.268 ^9.217 ^-0.150 0 0 0 0 1 force @a
  particle sweep_attack ^-0.601 ^9.401 ^2.470 0 0 0 0 1 force @a
  particle sweep_attack ^0.692 ^9.585 ^-0.024 0 0 0 0 1 force @a
  particle sweep_attack ^-1.048 ^9.770 ^-3.312 0 0 0 0 1 force @a
  particle sweep_attack ^-1.929 ^9.954 ^1.261 0 0 0 0 1 force @a
  particle sweep_attack ^1.893 ^10.138 ^1.657 0 0 0 0 1 force @a
  particle sweep_attack ^0.603 ^10.323 ^-1.259 0 0 0 0 1 force @a
  particle sweep_attack ^-4.139 ^10.507 ^-0.729 0 0 0 0 1 force @a
  particle sweep_attack ^0.338 ^10.691 ^3.428 0 0 0 0 1 force @a
  particle sweep_attack ^2.684 ^10.876 ^-1.044 0 0 0 0 1 force @a
  particle sweep_attack ^-1.573 ^11.060 ^-2.098 0 0 0 0 1 force @a
  particle sweep_attack ^-1.015 ^11.244 ^1.321 0 0 0 0 1 force @a
  particle sweep_attack ^3.201 ^11.429 ^1.287 0 0 0 0 1 force @a
  particle sweep_attack ^0.335 ^11.613 ^-3.035 0 0 0 0 1 force @a
  particle sweep_attack ^-0.237 ^11.797 ^0.039 0 0 0 0 1 force @a
  particle sweep_attack ^1.366 ^11.982 ^2.938 0 0 0 0 1 force @a
  particle sweep_attack ^0.240 ^12.166 ^-0.205 0 0 0 0 1 force @a
  particle sweep_attack ^-1.672 ^12.350 ^-1.121 0 0 0 0 1 force @a
  particle sweep_attack ^-1.350 ^12.535 ^4.101 0 0 0 0 1 force @a
  particle sweep_attack ^4.188 ^12.719 ^0.191 0 0 0 0 1 force @a
  particle sweep_attack ^-0.360 ^12.903 ^-1.560 0 0 0 0 1 force @a
  particle sweep_attack ^-3.170 ^13.088 ^1.730 0 0 0 0 1 force @a
  particle sweep_attack ^0.840 ^13.272 ^0.863 0 0 0 0 1 force @a
  particle sweep_attack ^1.602 ^13.456 ^-2.758 0 0 0 0 1 force @a
  particle sweep_attack ^-1.320 ^13.641 ^-0.342 0 0 0 0 1 force @a
  particle sweep_attack ^0.000 ^13.825 ^0.000 0 0 0 0 1 force @a
  particle sweep_attack ^3.678 ^14.009 ^-1.103 0 0 0 0 1 force @a
  particle sweep_attack ^-2.276 ^14.194 ^-3.599 0 0 0 0 1 force @a
  particle sweep_attack ^-2.748 ^14.378 ^3.043 0 0 0 0 1 force @a
  particle sweep_attack ^2.655 ^14.562 ^1.322 0 0 0 0 1 force @a
  particle sweep_attack ^0.612 ^14.747 ^-3.192 0 0 0 0 1 force @a
  particle sweep_attack ^-5.869 ^14.931 ^0.489 0 0 0 0 1 force @a
  particle sweep_attack ^0.897 ^15.115 ^2.414 0 0 0 0 1 force @a
  particle sweep_attack ^3.966 ^15.300 ^-2.880 0 0 0 0 1 force @a
  particle sweep_attack ^-0.180 ^15.484 ^-0.142 0 0 0 0 1 force @a
  particle sweep_attack ^-2.202 ^15.668 ^5.243 0 0 0 0 1 force @a
  particle sweep_attack ^3.554 ^15.853 ^0.447 0 0 0 0 1 force @a
  particle sweep_attack ^-0.637 ^16.037 ^-4.289 0 0 0 0 1 force @a
  particle sweep_attack ^-1.618 ^16.221 ^0.723 0 0 0 0 1 force @a
  particle sweep_attack ^0.698 ^16.406 ^0.842 0 0 0 0 1 force @a
  particle sweep_attack ^0.105 ^16.590 ^-0.152 0 0 0 0 1 force @a
  particle sweep_attack ^-2.671 ^16.774 ^-0.925 0 0 0 0 1 force @a
  particle sweep_attack ^-0.027 ^16.959 ^0.439 0 0 0 0 1 force @a
  particle sweep_attack ^5.276 ^17.143 ^-1.134 0 0 0 0 1 force @a
  particle sweep_attack ^-1.718 ^17.327 ^-3.266 0 0 0 0 1 force @a
  particle sweep_attack ^-2.641 ^17.512 ^2.494 0 0 0 0 1 force @a
  particle sweep_attack ^3.623 ^17.696 ^2.179 0 0 0 0 1 force @a
  particle sweep_attack ^1.408 ^17.880 ^-5.107 0 0 0 0 1 force @a
  particle sweep_attack ^-5.018 ^18.065 ^0.018 0 0 0 0 1 force @a
  particle sweep_attack ^1.621 ^18.249 ^5.722 0 0 0 0 1 force @a
  particle sweep_attack ^5.883 ^18.433 ^-3.596 0 0 0 0 1 force @a
  particle sweep_attack ^-0.984 ^18.618 ^-0.916 0 0 0 0 1 force @a
  particle sweep_attack ^-2.159 ^18.802 ^4.176 0 0 0 0 1 force @a
  particle sweep_attack ^1.859 ^18.986 ^0.386 0 0 0 0 1 force @a
  particle sweep_attack ^-0.014 ^19.171 ^-0.213 0 0 0 0 1 force @a
  particle sweep_attack ^-1.149 ^19.355 ^0.407 0 0 0 0 1 force @a
  particle sweep_attack ^3.601 ^19.539 ^5.120 0 0 0 0 1 force @a
  particle sweep_attack ^4.254 ^19.724 ^-5.203 0 0 0 0 1 force @a
  particle sweep_attack ^-3.985 ^19.908 ^-1.745 0 0 0 0 1 force @a
  particle sweep_attack ^-0.125 ^20.092 ^0.884 0 0 0 0 1 force @a
  particle sweep_attack ^2.270 ^20.276 ^-0.302 0 0 0 0 1 force @a
  particle sweep_attack ^-1.641 ^20.461 ^-3.831 0 0 0 0 1 force @a
  particle sweep_attack ^-5.363 ^20.645 ^4.313 0 0 0 0 1 force @a
  particle sweep_attack ^5.961 ^20.829 ^4.264 0 0 0 0 1 force @a
  particle sweep_attack ^1.036 ^21.014 ^-2.853 0 0 0 0 1 force @a
  particle sweep_attack ^-4.423 ^21.198 ^-0.337 0 0 0 0 1 force @a
  particle sweep_attack ^0.626 ^21.382 ^3.146 0 0 0 0 1 force @a
  particle sweep_attack ^7.410 ^21.567 ^-3.756 0 0 0 0 1 force @a
  particle sweep_attack ^-3.047 ^21.751 ^-3.327 0 0 0 0 1 force @a
  particle sweep_attack ^-0.086 ^21.935 ^0.138 0 0 0 0 1 force @a
  particle sweep_attack ^0.000 ^22.120 ^0.000 0 0 0 0 1 force @a
  particle sweep_attack ^0.038 ^22.304 ^-3.263 0 0 0 0 1 force @a
  particle sweep_attack ^-4.144 ^22.488 ^1.107 0 0 0 0 1 force @a
  particle sweep_attack ^4.313 ^22.673 ^7.303 0 0 0 0 1 force @a
  particle sweep_attack ^5.715 ^22.857 ^-5.955 0 0 0 0 1 force @a
  particle sweep_attack ^-5.302 ^23.041 ^-2.844 0 0 0 0 1 force @a
  particle sweep_attack ^-0.553 ^23.226 ^2.477 0 0 0 0 1 force @a
  particle sweep_attack ^5.541 ^23.410 ^-0.292 0 0 0 0 1 force @a
  particle sweep_attack ^-1.703 ^23.594 ^-5.051 0 0 0 0 1 force @a
  particle sweep_attack ^-5.496 ^23.779 ^3.742 0 0 0 0 1 force @a
  particle sweep_attack ^3.087 ^23.963 ^2.603 0 0 0 0 1 force @a
  particle sweep_attack ^2.506 ^24.147 ^-5.492 0 0 0 0 1 force @a
  particle sweep_attack ^-2.359 ^24.332 ^-0.370 0 0 0 0 1 force @a
  particle sweep_attack ^1.098 ^24.516 ^9.334 0 0 0 0 1 force @a
  particle sweep_attack ^8.674 ^24.700 ^-3.561 0 0 0 0 1 force @a
  particle sweep_attack ^-3.286 ^24.885 ^-4.216 0 0 0 0 1 force @a
  particle sweep_attack ^-3.751 ^25.069 ^5.079 0 0 0 0 1 force @a
  particle sweep_attack ^8.130 ^25.253 ^3.094 0 0 0 0 1 force @a
  particle sweep_attack ^0.836 ^25.438 ^-9.148 0 0 0 0 1 force @a
  particle sweep_attack ^-8.261 ^25.622 ^1.515 0 0 0 0 1 force @a
  particle sweep_attack ^4.505 ^25.806 ^9.234 0 0 0 0 1 force @a
  particle sweep_attack ^5.721 ^25.991 ^-5.083 0 0 0 0 1 force @a
  particle sweep_attack ^-1.345 ^26.175 ^-0.866 0 0 0 0 1 force @a
  particle sweep_attack ^-1.065 ^26.359 ^3.452 0 0 0 0 1 force @a
  particle sweep_attack ^7.420 ^26.544 ^0.199 0 0 0 0 1 force @a
  particle sweep_attack ^-1.963 ^26.728 ^-7.826 0 0 0 0 1 force @a
  particle sweep_attack ^-8.009 ^26.912 ^4.567 0 0 0 0 1 force @a
  particle sweep_attack ^2.818 ^27.097 ^2.788 0 0 0 0 1 force @a
  particle sweep_attack ^3.315 ^27.281 ^-5.961 0 0 0 0 1 force @a
  particle sweep_attack ^-10.437 ^27.465 ^-2.499 0 0 0 0 1 force @a
  particle sweep_attack ^0.321 ^27.650 ^8.545 0 0 0 0 1 force @a
  particle sweep_attack ^3.682 ^27.834 ^-1.180 0 0 0 0 1 force @a
  particle sweep_attack ^-2.084 ^28.018 ^-3.163 0 0 0 0 1 force @a
  particle sweep_attack ^-7.059 ^28.203 ^8.119 0 0 0 0 1 force @a
  particle sweep_attack ^6.079 ^28.387 ^2.885 0 0 0 0 1 force @a
  particle sweep_attack ^0.961 ^28.571 ^-5.579 0 0 0 0 1 force @a
  particle sweep_attack ^-9.324 ^28.756 ^0.953 0 0 0 0 1 force @a
  particle sweep_attack ^0.020 ^28.940 ^0.050 0 0 0 0 1 force @a
  particle sweep_attack ^0.990 ^29.124 ^-0.748 0 0 0 0 1 force @a
  particle sweep_attack ^-3.496 ^29.309 ^-2.665 0 0 0 0 1 force @a
  particle sweep_attack ^-0.687 ^29.493 ^1.725 0 0 0 0 1 force @a
  particle sweep_attack ^5.629 ^29.677 ^0.601 0 0 0 0 1 force @a
  particle sweep_attack ^-0.137 ^29.862 ^-0.818 0 0 0 0 1 force @a
  particle sweep_attack ^-6.750 ^30.046 ^3.167 0 0 0 0 1 force @a
  particle sweep_attack ^2.266 ^30.230 ^2.629 0 0 0 0 1 force @a
  particle sweep_attack ^0.468 ^30.415 ^-0.703 0 0 0 0 1 force @a
  particle sweep_attack ^-5.442 ^30.599 ^-1.770 0 0 0 0 1 force @a
  particle sweep_attack ^-0.476 ^30.783 ^11.334 0 0 0 0 1 force @a
  particle sweep_attack ^8.654 ^30.968 ^-2.031 0 0 0 0 1 force @a
  particle sweep_attack ^-0.056 ^31.152 ^-0.101 0 0 0 0 1 force @a
  particle sweep_attack ^-2.693 ^31.336 ^2.641 0 0 0 0 1 force @a
  particle sweep_attack ^6.272 ^31.521 ^3.613 0 0 0 0 1 force @a
  particle sweep_attack ^2.398 ^31.705 ^-9.386 0 0 0 0 1 force @a
  particle sweep_attack ^-4.959 ^31.889 ^0.111 0 0 0 0 1 force @a
  particle sweep_attack ^2.399 ^32.074 ^7.900 0 0 0 0 1 force @a
  particle sweep_attack ^3.577 ^32.258 ^-2.279 0 0 0 0 1 force @a
  particle sweep_attack ^-1.431 ^32.442 ^-1.283 0 0 0 0 1 force @a
  particle sweep_attack ^-2.754 ^32.627 ^5.581 0 0 0 0 1 force @a
  particle sweep_attack ^8.062 ^32.811 ^1.516 0 0 0 0 1 force @a
  particle sweep_attack ^-0.037 ^32.995 ^-0.426 0 0 0 0 1 force @a
  particle sweep_attack ^-9.836 ^33.180 ^3.694 0 0 0 0 1 force @a
  particle sweep_attack ^0.438 ^33.364 ^0.598 0 0 0 0 1 force @a
  particle sweep_attack ^7.298 ^33.548 ^-9.278 0 0 0 0 1 force @a
  particle sweep_attack ^-4.268 ^33.733 ^-1.775 0 0 0 0 1 force @a
  particle sweep_attack ^-0.046 ^33.917 ^0.374 0 0 0 0 1 force @a
  particle sweep_attack ^12.861 ^34.101 ^-1.957 0 0 0 0 1 force @a
  particle sweep_attack ^-3.497 ^34.286 ^-7.756 0 0 0 0 1 force @a
  particle sweep_attack ^-4.360 ^34.470 ^3.643 0 0 0 0 1 force @a
  particle sweep_attack ^2.380 ^34.654 ^1.636 0 0 0 0 1 force @a
  particle sweep_attack ^3.822 ^34.839 ^-11.171 0 0 0 0 1 force @a
  particle sweep_attack ^-4.662 ^35.023 ^-0.267 0 0 0 0 1 force @a
  particle sweep_attack ^0.794 ^35.207 ^3.630 0 0 0 0 1 force @a
  particle sweep_attack ^6.253 ^35.392 ^-3.318 0 0 0 0 1 force @a
  particle sweep_attack ^-4.041 ^35.576 ^-4.248 0 0 0 0 1 force @a
  particle sweep_attack ^-1.120 ^35.760 ^1.877 0 0 0 0 1 force @a
  particle sweep_attack ^6.359 ^35.945 ^1.728 0 0 0 0 1 force @a
  particle sweep_attack ^-0.087 ^36.129 ^-12.177 0 0 0 0 1 force @a
  particle sweep_attack ^-4.977 ^36.313 ^1.429 0 0 0 0 1 force @a
  particle sweep_attack ^3.723 ^36.498 ^6.042 0 0 0 0 1 force @a
  particle sweep_attack ^7.930 ^36.682 ^-8.580 0 0 0 0 1 force @a
  particle sweep_attack ^-9.721 ^36.866 ^-4.982 0 0 0 0 1 force @a
  particle sweep_attack ^-2.151 ^37.051 ^10.555 0 0 0 0 1 force @a
  particle sweep_attack ^12.449 ^37.235 ^-0.892 0 0 0 0 1 force @a
  particle sweep_attack ^-4.557 ^37.419 ^-12.721 0 0 0 0 1 force @a
  particle sweep_attack ^-6.193 ^37.604 ^4.389 0 0 0 0 1 force @a
  particle sweep_attack ^11.737 ^37.788 ^9.525 0 0 0 0 1 force @a
  particle sweep_attack ^2.378 ^37.972 ^-5.484 0 0 0 0 1 force @a
  particle sweep_attack ^-4.480 ^38.157 ^-0.616 0 0 0 0 1 force @a
  particle sweep_attack ^1.192 ^38.341 ^8.723 0 0 0 0 1 force @a
  particle sweep_attack ^7.202 ^38.525 ^-3.116 0 0 0 0 1 force @a
  particle sweep_attack ^-2.482 ^38.710 ^-3.064 0 0 0 0 1 force @a
  particle sweep_attack ^-8.923 ^38.894 ^12.568 0 0 0 0 1 force @a
  particle sweep_attack ^2.588 ^39.078 ^0.930 0 0 0 0 1 force @a
  particle sweep_attack ^0.158 ^39.263 ^-2.176 0 0 0 0 1 force @a
  particle sweep_attack ^-7.517 ^39.447 ^1.525 0 0 0 0 1 force @a
  particle sweep_attack ^6.315 ^39.631 ^12.350 0 0 0 0 1 force @a
  particle sweep_attack ^9.971 ^39.816 ^-9.200 0 0 0 0 1 force @a

  #Particles Generated with: Cloud Wolf's Particle Grapher
  # x: t*sin(20*t)/2 * (r/5)
  # y: t*2
  # z: t*cos(20*t)/2 * (r/5)
  # Points: 700
  particle campfire_signal_smoke ^0.000 ^0.000 ^0.000 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.002 ^0.057 ^0.002 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.018 ^0.114 ^0.008 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.018 ^0.171 ^-0.003 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.010 ^0.229 ^-0.009 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.025 ^0.286 ^-0.085 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.023 ^0.343 ^-0.078 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.097 ^0.400 ^-0.084 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.047 ^0.457 ^-0.007 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.034 ^0.514 ^0.015 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.047 ^0.571 ^0.073 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.000 ^0.629 ^0.077 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.031 ^0.686 ^0.047 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.014 ^0.743 ^0.006 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.095 ^0.800 ^-0.014 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.103 ^0.857 ^-0.090 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.041 ^0.914 ^-0.141 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.077 ^0.971 ^-0.259 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.006 ^1.029 ^-0.005 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.044 ^1.086 ^-0.006 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.067 ^1.143 ^0.031 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.018 ^1.200 ^0.029 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.001 ^1.257 ^0.195 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.166 ^1.314 ^0.255 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.016 ^1.371 ^0.007 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.182 ^1.429 ^-0.027 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.175 ^1.486 ^-0.154 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.011 ^1.543 ^-0.037 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.126 ^1.600 ^-0.419 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.348 ^1.657 ^-0.297 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.205 ^1.714 ^-0.028 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.122 ^1.771 ^0.057 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.235 ^1.829 ^0.371 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.002 ^1.886 ^0.243 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.299 ^1.943 ^0.457 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.299 ^2.000 ^0.134 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.498 ^2.057 ^-0.076 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.186 ^2.114 ^-0.164 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.044 ^2.171 ^-0.155 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.113 ^2.229 ^-0.372 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.518 ^2.286 ^-0.441 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.160 ^2.343 ^-0.021 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.408 ^2.400 ^0.191 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.298 ^2.457 ^0.473 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.007 ^2.514 ^0.656 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.044 ^2.571 ^0.067 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.082 ^2.629 ^0.036 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.394 ^2.686 ^-0.061 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.609 ^2.743 ^-0.539 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.039 ^2.800 ^-0.137 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.173 ^2.857 ^-0.566 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.356 ^2.914 ^-0.301 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.470 ^2.971 ^-0.062 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.345 ^3.029 ^0.163 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.457 ^3.086 ^0.731 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.010 ^3.143 ^0.786 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.551 ^3.200 ^0.834 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.291 ^3.257 ^0.128 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.634 ^3.314 ^-0.100 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.312 ^3.371 ^-0.278 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.295 ^3.429 ^-1.057 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.124 ^3.486 ^-0.403 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.098 ^3.543 ^-0.082 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.380 ^3.600 ^-0.049 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.643 ^3.657 ^0.305 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.495 ^3.714 ^0.796 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.020 ^3.771 ^1.305 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.101 ^3.829 ^0.151 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.456 ^3.886 ^0.200 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.115 ^3.943 ^-0.018 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.265 ^4.000 ^-0.237 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.372 ^4.057 ^-1.347 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.250 ^4.114 ^-0.803 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.785 ^4.171 ^-0.658 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.217 ^4.229 ^-0.154 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.097 ^4.286 ^0.046 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.252 ^4.343 ^0.408 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.017 ^4.400 ^0.944 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.557 ^4.457 ^0.834 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.727 ^4.514 ^0.316 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.096 ^4.571 ^-0.178 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.504 ^4.629 ^-0.454 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.146 ^4.686 ^-0.533 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.439 ^4.743 ^-1.396 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.529 ^4.800 ^-0.441 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.174 ^4.857 ^-0.145 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.773 ^4.914 ^0.372 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.184 ^4.971 ^0.299 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.013 ^5.029 ^0.633 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.184 ^5.086 ^0.274 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.090 ^5.143 ^0.039 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.018 ^5.200 ^-0.003 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.526 ^5.257 ^-0.476 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.069 ^5.314 ^-0.256 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.338 ^5.371 ^-1.065 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.413 ^5.429 ^-1.171 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.073 ^5.486 ^-0.130 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.679 ^5.543 ^0.328 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.010 ^5.600 ^0.017 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.032 ^5.657 ^1.391 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.640 ^5.714 ^0.947 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.798 ^5.771 ^0.342 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.060 ^5.829 ^-0.010 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.910 ^5.886 ^-0.827 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.194 ^5.943 ^-0.726 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.149 ^6.000 ^-0.466 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.467 ^6.057 ^-1.210 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.078 ^6.114 ^-0.128 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.185 ^6.171 ^0.577 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.017 ^6.229 ^1.674 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.018 ^6.286 ^0.710 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.449 ^6.343 ^0.661 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.768 ^6.400 ^0.327 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.260 ^6.457 ^-0.215 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.231 ^6.514 ^-1.125 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.022 ^6.571 ^-0.083 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.273 ^6.629 ^-0.845 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.145 ^6.686 ^-0.119 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.236 ^6.743 ^-0.144 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.551 ^6.800 ^0.760 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.848 ^6.857 ^1.403 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.043 ^6.914 ^1.552 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.030 ^6.971 ^1.508 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.191 ^7.029 ^0.081 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.744 ^7.086 ^-0.129 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.942 ^7.143 ^-0.865 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.243 ^7.200 ^-0.926 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.060 ^7.257 ^-0.183 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.320 ^7.314 ^-1.078 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.417 ^7.371 ^-0.047 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.295 ^7.429 ^1.132 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.829 ^7.486 ^1.380 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.065 ^7.543 ^2.141 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.583 ^7.600 ^0.849 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.326 ^7.657 ^0.977 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.026 ^7.714 ^-0.180 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.159 ^7.771 ^-1.070 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.616 ^7.829 ^-2.372 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.718 ^7.886 ^-2.188 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.968 ^7.943 ^-0.786 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.298 ^8.000 ^-0.033 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.151 ^8.057 ^0.571 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.462 ^8.114 ^0.773 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.024 ^8.171 ^0.715 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.475 ^8.229 ^2.136 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.637 ^8.286 ^0.682 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.522 ^8.343 ^-0.093 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.875 ^8.400 ^-1.739 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.183 ^8.457 ^-0.713 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.605 ^8.514 ^-1.827 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.327 ^8.571 ^-0.264 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.591 ^8.629 ^-0.281 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.089 ^8.686 ^0.045 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.547 ^8.743 ^0.921 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.004 ^8.800 ^0.106 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.205 ^8.857 ^1.735 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.465 ^8.914 ^0.193 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.817 ^8.971 ^-0.148 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.862 ^9.029 ^-0.803 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.587 ^9.086 ^-2.307 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.571 ^9.143 ^-1.708 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.040 ^9.200 ^-0.836 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.942 ^9.257 ^-0.206 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.305 ^9.314 ^1.159 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.865 ^9.371 ^1.465 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.034 ^9.429 ^0.886 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.491 ^9.486 ^0.704 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.158 ^9.543 ^0.887 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.403 ^9.600 ^-0.441 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.913 ^9.657 ^-1.793 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.779 ^9.714 ^-3.095 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.633 ^9.771 ^-1.880 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.948 ^9.829 ^-0.758 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.429 ^9.886 ^-0.251 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.985 ^9.943 ^0.498 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.218 ^10.000 ^0.371 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.122 ^10.057 ^3.020 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.147 ^10.114 ^1.635 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.005 ^10.171 ^0.002 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.554 ^10.229 ^-0.289 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.523 ^10.286 ^-2.376 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.024 ^10.343 ^-0.095 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.554 ^10.400 ^-1.630 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.551 ^10.457 ^-1.234 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.653 ^10.514 ^-0.167 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.478 ^10.571 ^1.261 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.528 ^10.629 ^0.904 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.092 ^10.686 ^2.130 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.297 ^10.743 ^1.839 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.442 ^10.800 ^0.990 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.462 ^10.857 ^-0.653 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.063 ^10.914 ^-0.060 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.599 ^10.971 ^-2.434 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.343 ^11.029 ^-1.002 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.043 ^11.086 ^-0.034 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.686 ^11.143 ^-0.166 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.691 ^11.200 ^1.379 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.921 ^11.257 ^1.587 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.168 ^11.314 ^3.696 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.477 ^11.371 ^2.082 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.868 ^11.429 ^1.154 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.570 ^11.486 ^-0.683 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.321 ^11.543 ^-1.257 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.758 ^11.600 ^-3.111 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.067 ^11.657 ^-3.091 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.534 ^11.714 ^-0.420 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.338 ^11.771 ^-0.224 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.016 ^11.829 ^0.008 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.787 ^11.886 ^1.364 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.170 ^11.943 ^3.543 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.540 ^12.000 ^2.159 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.286 ^12.057 ^1.312 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.104 ^12.114 ^-0.602 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.309 ^12.171 ^-2.208 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.821 ^12.229 ^-3.406 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.794 ^12.286 ^-2.280 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.092 ^12.343 ^-0.072 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.080 ^12.400 ^-0.007 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.449 ^12.457 ^0.751 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.513 ^12.514 ^2.638 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.175 ^12.571 ^3.459 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.545 ^12.629 ^2.155 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.703 ^12.686 ^1.468 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.288 ^12.743 ^-0.646 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.929 ^12.800 ^-1.854 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.705 ^12.857 ^-2.958 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.313 ^12.914 ^-3.741 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.221 ^12.971 ^-1.730 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.318 ^13.029 ^-0.029 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.075 ^13.086 ^0.039 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.602 ^13.143 ^2.808 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.075 ^13.200 ^1.404 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.585 ^13.257 ^3.587 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.841 ^13.314 ^1.511 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.318 ^13.371 ^-0.262 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.686 ^13.429 ^-0.662 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.062 ^13.486 ^-4.509 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.513 ^13.543 ^-1.449 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.113 ^13.600 ^-0.087 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.850 ^13.657 ^-0.339 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-4.219 ^13.714 ^2.216 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.615 ^13.771 ^1.084 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.236 ^13.829 ^4.239 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.016 ^13.886 ^0.022 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.688 ^13.943 ^1.050 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^4.076 ^14.000 ^-0.823 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.510 ^14.057 ^-3.407 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.012 ^14.114 ^-4.344 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.886 ^14.171 ^-2.483 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.693 ^14.229 ^-2.076 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.060 ^14.286 ^-0.262 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.325 ^14.343 ^0.700 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.078 ^14.400 ^1.913 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.131 ^14.457 ^2.252 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.380 ^14.514 ^0.522 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.243 ^14.571 ^0.482 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.767 ^14.629 ^-0.157 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.101 ^14.686 ^-3.025 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.885 ^14.743 ^-3.843 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.149 ^14.800 ^-3.196 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.320 ^14.857 ^-1.013 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.196 ^14.914 ^-0.099 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.754 ^14.971 ^1.996 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.429 ^15.029 ^2.550 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.312 ^15.086 ^5.127 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.235 ^15.143 ^1.686 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.674 ^15.200 ^1.413 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.442 ^15.257 ^-0.299 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.192 ^15.314 ^-1.169 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.156 ^15.371 ^-5.081 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.216 ^15.429 ^-0.595 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.228 ^15.486 ^-0.174 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-4.640 ^15.543 ^-0.373 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.722 ^15.600 ^0.386 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.825 ^15.657 ^3.276 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.334 ^15.714 ^5.269 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.459 ^15.771 ^1.981 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.867 ^15.829 ^1.476 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.397 ^15.886 ^-0.712 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.033 ^15.943 ^-1.018 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.572 ^16.000 ^-2.544 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.094 ^16.057 ^-2.994 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.896 ^16.114 ^-2.957 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-5.433 ^16.171 ^-0.423 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.208 ^16.229 ^1.188 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.458 ^16.286 ^0.826 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.217 ^16.343 ^3.294 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.907 ^16.400 ^1.226 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.755 ^16.457 ^1.423 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^4.313 ^16.514 ^-0.916 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.918 ^16.571 ^-0.910 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.512 ^16.629 ^-2.305 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.190 ^16.686 ^-0.517 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.468 ^16.743 ^-0.353 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.049 ^16.800 ^-0.230 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.697 ^16.857 ^0.377 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.957 ^16.914 ^3.556 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.244 ^16.971 ^3.564 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.046 ^17.029 ^0.061 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.734 ^17.086 ^1.404 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^5.120 ^17.143 ^-1.101 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.262 ^17.200 ^-0.261 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.620 ^17.257 ^-2.823 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.283 ^17.314 ^-0.763 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.625 ^17.371 ^-1.972 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.582 ^17.429 ^-0.042 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-4.768 ^17.486 ^2.597 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.808 ^17.543 ^5.133 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.214 ^17.600 ^3.011 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.788 ^17.657 ^1.053 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.651 ^17.714 ^1.362 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.535 ^17.771 ^-0.552 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.347 ^17.829 ^-0.347 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.210 ^17.886 ^-0.970 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.184 ^17.943 ^-5.840 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.468 ^18.000 ^-2.591 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.495 ^18.057 ^-0.175 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.407 ^18.114 ^1.867 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.037 ^18.171 ^1.908 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.045 ^18.229 ^0.609 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.236 ^18.286 ^1.644 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^4.610 ^18.343 ^1.707 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.611 ^18.400 ^-0.135 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.983 ^18.457 ^-0.988 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.499 ^18.514 ^-2.326 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.981 ^18.571 ^-5.257 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.319 ^18.629 ^-2.467 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.920 ^18.686 ^-0.130 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.008 ^18.743 ^0.005 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.618 ^18.800 ^2.993 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.417 ^18.857 ^5.481 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.118 ^18.914 ^1.479 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^4.301 ^18.971 ^1.580 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^5.126 ^19.029 ^-1.143 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.423 ^19.086 ^-2.449 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.308 ^19.143 ^-6.180 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.176 ^19.200 ^-3.096 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.394 ^19.257 ^-1.030 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-4.761 ^19.314 ^-0.310 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.983 ^19.371 ^0.545 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.883 ^19.429 ^5.365 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.152 ^19.486 ^1.933 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.118 ^19.543 ^0.156 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.895 ^19.600 ^1.420 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^4.449 ^19.657 ^-1.004 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.558 ^19.714 ^-2.599 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.171 ^19.771 ^-5.603 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.173 ^19.829 ^-3.065 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-5.191 ^19.886 ^-3.817 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.677 ^19.943 ^-0.168 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.760 ^20.000 ^1.540 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.014 ^20.057 ^5.644 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.114 ^20.114 ^1.403 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.255 ^20.171 ^1.643 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.673 ^20.229 ^0.967 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.740 ^20.286 ^-0.397 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.907 ^20.343 ^-3.990 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.818 ^20.400 ^-3.966 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.766 ^20.457 ^-4.581 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-4.918 ^20.514 ^-3.597 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-5.565 ^20.571 ^-0.334 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.340 ^20.629 ^0.752 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.380 ^20.686 ^6.368 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.566 ^20.743 ^6.770 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.705 ^20.800 ^3.522 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.482 ^20.857 ^0.532 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.658 ^20.914 ^-0.845 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.644 ^20.971 ^-3.740 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.355 ^21.029 ^-1.741 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.347 ^21.086 ^-0.894 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-5.369 ^21.143 ^-3.906 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.323 ^21.200 ^-0.191 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-6.173 ^21.257 ^3.485 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.502 ^21.314 ^2.847 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.442 ^21.371 ^5.131 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.815 ^21.429 ^3.647 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^4.069 ^21.486 ^1.448 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^4.489 ^21.543 ^-1.049 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.345 ^21.600 ^-2.419 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.209 ^21.657 ^-1.040 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.083 ^21.714 ^-0.212 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.201 ^21.771 ^-2.317 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.487 ^21.829 ^-0.192 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.759 ^21.886 ^2.134 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.787 ^21.943 ^5.315 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.035 ^22.000 ^0.394 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.257 ^22.057 ^0.331 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^6.579 ^22.114 ^2.323 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.269 ^22.171 ^-0.772 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.826 ^22.229 ^-0.856 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.145 ^22.286 ^-0.732 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.679 ^22.343 ^-6.797 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.263 ^22.400 ^-1.629 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-6.033 ^22.457 ^-0.317 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-4.320 ^22.514 ^2.468 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.934 ^22.571 ^1.791 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.485 ^22.629 ^5.307 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.142 ^22.686 ^2.746 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^6.804 ^22.743 ^2.383 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^5.112 ^22.800 ^-1.221 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.839 ^22.857 ^-0.874 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.178 ^22.914 ^-0.911 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.073 ^22.971 ^-2.701 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.398 ^23.029 ^-2.433 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.839 ^23.086 ^-0.192 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.421 ^23.143 ^0.242 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.856 ^23.200 ^3.585 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.078 ^23.257 ^0.834 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^4.762 ^23.314 ^6.073 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.132 ^23.371 ^0.046 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.209 ^23.429 ^-0.534 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.246 ^23.486 ^-2.353 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.065 ^23.543 ^-5.513 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.622 ^23.600 ^-1.556 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.185 ^23.657 ^-0.844 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-7.473 ^23.714 ^-0.354 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.161 ^23.771 ^1.249 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.250 ^23.829 ^6.314 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.757 ^23.886 ^7.858 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.216 ^23.943 ^2.811 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.794 ^24.000 ^0.274 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^5.539 ^24.057 ^-1.353 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.475 ^24.114 ^-2.605 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.973 ^24.171 ^-5.105 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.063 ^24.229 ^-0.157 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.912 ^24.286 ^-1.355 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.000 ^24.343 ^0.000 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-5.632 ^24.400 ^3.274 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.213 ^24.457 ^6.282 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.112 ^24.514 ^1.134 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.488 ^24.571 ^0.616 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.864 ^24.629 ^0.637 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^5.081 ^24.686 ^-1.255 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^5.005 ^24.743 ^-5.296 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.599 ^24.800 ^-8.506 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.893 ^24.857 ^-4.664 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.479 ^24.914 ^-0.337 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.998 ^24.971 ^-0.042 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.830 ^25.029 ^1.655 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.040 ^25.086 ^4.014 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.251 ^25.143 ^2.476 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^5.079 ^25.200 ^6.377 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.064 ^25.257 ^0.361 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^6.754 ^25.314 ^-1.686 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^5.284 ^25.371 ^-5.619 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.231 ^25.429 ^-6.638 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.019 ^25.486 ^-0.047 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.847 ^25.543 ^-0.594 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-5.819 ^25.600 ^-0.232 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-6.712 ^25.657 ^3.947 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.188 ^25.714 ^2.353 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.604 ^25.771 ^5.806 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^4.173 ^25.829 ^5.212 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.761 ^25.886 ^0.256 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^4.515 ^25.943 ^-1.139 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^5.587 ^26.000 ^-5.971 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.040 ^26.057 ^-0.218 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.184 ^26.114 ^-0.447 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.011 ^26.171 ^-0.007 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-6.788 ^26.229 ^-0.253 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.158 ^26.286 ^0.094 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.043 ^26.343 ^6.062 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.974 ^26.400 ^9.135 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.090 ^26.457 ^2.597 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^6.188 ^26.514 ^2.062 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.952 ^26.571 ^-1.008 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^5.625 ^26.629 ^-6.042 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.351 ^26.686 ^-7.498 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.105 ^26.743 ^-7.485 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-5.187 ^26.800 ^-3.596 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.134 ^26.857 ^-0.074 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-4.429 ^26.914 ^2.635 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.817 ^26.971 ^5.648 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.202 ^27.029 ^1.854 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^5.417 ^27.086 ^6.696 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.095 ^27.143 ^0.362 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.817 ^27.200 ^-0.468 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^5.168 ^27.257 ^-5.579 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.995 ^27.314 ^-5.607 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.797 ^27.371 ^-1.907 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.452 ^27.429 ^-0.311 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-7.335 ^27.486 ^-0.236 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.083 ^27.543 ^0.049 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.605 ^27.600 ^5.255 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.534 ^27.657 ^4.783 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^4.065 ^27.714 ^4.999 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.409 ^27.771 ^0.134 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^7.460 ^27.829 ^-1.943 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.277 ^27.886 ^-2.471 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.900 ^27.943 ^-5.147 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.399 ^28.000 ^-8.078 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-6.132 ^28.057 ^-4.205 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.981 ^28.114 ^-0.059 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.910 ^28.171 ^2.353 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.723 ^28.229 ^7.559 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.901 ^28.286 ^7.883 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.650 ^28.343 ^4.466 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.390 ^28.400 ^0.777 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.092 ^28.457 ^-0.550 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.698 ^28.514 ^-2.942 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.716 ^28.571 ^-4.153 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.742 ^28.629 ^-4.112 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-7.773 ^28.686 ^-5.302 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.635 ^28.743 ^-0.099 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.735 ^28.800 ^1.655 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.564 ^28.857 ^7.284 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.164 ^28.914 ^1.407 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^4.874 ^28.971 ^5.932 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^4.393 ^29.029 ^1.415 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.289 ^29.086 ^-0.874 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.041 ^29.143 ^-1.141 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.158 ^29.200 ^-6.823 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.073 ^29.257 ^-4.857 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.977 ^29.314 ^-1.341 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-6.533 ^29.371 ^-0.161 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.621 ^29.429 ^0.987 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.856 ^29.486 ^5.874 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.167 ^29.543 ^9.768 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.572 ^29.600 ^4.325 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.127 ^29.657 ^0.041 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^9.140 ^29.714 ^-2.455 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^4.262 ^29.771 ^-4.696 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.932 ^29.829 ^-5.575 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.935 ^29.886 ^-9.157 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.745 ^29.943 ^-0.502 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.455 ^30.000 ^-0.032 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-6.306 ^30.057 ^3.861 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.441 ^30.114 ^2.983 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.459 ^30.171 ^3.759 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.867 ^30.229 ^3.454 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^5.688 ^30.286 ^1.800 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.469 ^30.343 ^-0.127 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.861 ^30.400 ^-4.276 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.718 ^30.457 ^-10.443 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.157 ^30.514 ^-2.674 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.193 ^30.571 ^-0.801 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-10.580 ^30.629 ^-0.207 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-8.584 ^30.686 ^5.285 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.712 ^30.743 ^7.733 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.266 ^30.800 ^10.162 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.568 ^30.857 ^4.277 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.254 ^30.914 ^0.393 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.255 ^30.971 ^-0.618 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.702 ^31.029 ^-4.120 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.338 ^31.086 ^-2.087 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.308 ^31.143 ^-5.296 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.946 ^31.200 ^-1.299 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-6.907 ^31.257 ^-0.118 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-8.666 ^31.314 ^5.366 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.303 ^31.371 ^2.733 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.238 ^31.429 ^1.871 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.010 ^31.486 ^0.012 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^7.078 ^31.543 ^2.201 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.030 ^31.600 ^-0.008 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.983 ^31.657 ^-2.219 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.255 ^31.714 ^-7.877 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.570 ^31.771 ^-3.579 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.851 ^31.829 ^-1.892 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-11.031 ^31.886 ^-0.160 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-7.389 ^31.943 ^4.601 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.062 ^32.000 ^2.241 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.421 ^32.057 ^3.243 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^5.506 ^32.114 ^6.531 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^7.640 ^32.171 ^2.355 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.219 ^32.229 ^-0.620 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.633 ^32.286 ^-0.712 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.924 ^32.343 ^-5.895 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.506 ^32.400 ^-3.408 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-5.580 ^32.457 ^-3.683 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-8.372 ^32.514 ^-0.100 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.037 ^32.571 ^1.901 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.528 ^32.629 ^1.122 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.103 ^32.686 ^0.778 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^6.795 ^32.743 ^8.019 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^6.023 ^32.800 ^1.840 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^6.767 ^32.857 ^-1.909 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.167 ^32.914 ^-1.319 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.301 ^32.971 ^-1.955 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.456 ^33.029 ^-1.026 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.264 ^33.086 ^-2.142 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.867 ^33.143 ^-0.027 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.112 ^33.200 ^0.071 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.655 ^33.257 ^3.540 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.294 ^33.314 ^2.179 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^4.620 ^33.371 ^5.424 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.999 ^33.429 ^1.210 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^4.476 ^33.486 ^-1.275 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^6.583 ^33.543 ^-7.478 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.382 ^33.600 ^-9.119 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.144 ^33.657 ^-0.323 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.242 ^33.714 ^-0.811 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-6.484 ^33.771 ^-0.045 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-6.845 ^33.829 ^4.335 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.341 ^33.886 ^5.040 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.224 ^33.943 ^1.631 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.742 ^34.000 ^3.203 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^6.769 ^34.057 ^2.030 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^4.459 ^34.114 ^-1.282 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^5.617 ^34.171 ^-6.414 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.561 ^34.229 ^-10.478 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.974 ^34.286 ^-8.814 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.615 ^34.343 ^-2.347 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-10.509 ^34.400 ^-0.046 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-8.763 ^34.457 ^5.580 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.779 ^34.514 ^3.855 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.999 ^34.571 ^7.139 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.857 ^34.629 ^3.321 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.366 ^34.686 ^0.109 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.767 ^34.743 ^-0.223 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.978 ^34.800 ^-4.565 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.204 ^34.857 ^-8.226 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.431 ^34.914 ^-5.357 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.735 ^34.971 ^-0.474 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-6.515 ^35.029 ^-0.012 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.207 ^35.086 ^0.132 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.343 ^35.143 ^5.111 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.702 ^35.200 ^11.935 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^4.036 ^35.257 ^4.667 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^8.063 ^35.314 ^2.374 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^11.677 ^35.371 ^-3.422 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^6.579 ^35.429 ^-7.589 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.750 ^35.486 ^-5.216 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.294 ^35.543 ^-7.209 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.558 ^35.600 ^-1.000 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-12.337 ^35.657 ^0.008 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-7.026 ^35.714 ^4.524 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.439 ^35.771 ^7.553 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.443 ^35.829 ^3.049 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.979 ^35.886 ^4.577 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^7.936 ^35.943 ^2.315 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^9.614 ^36.000 ^-2.844 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.792 ^36.057 ^-4.396 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.490 ^36.114 ^-10.549 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.338 ^36.171 ^-2.908 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.282 ^36.229 ^-0.819 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.034 ^36.286 ^0.003 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-7.520 ^36.343 ^4.869 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.860 ^36.400 ^4.113 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.061 ^36.457 ^0.415 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^4.697 ^36.514 ^5.376 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^9.293 ^36.571 ^2.685 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.860 ^36.629 ^-0.555 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^8.206 ^36.686 ^-9.563 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.500 ^36.743 ^-3.603 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-4.739 ^36.800 ^-10.235 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-10.828 ^36.857 ^-6.875 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-6.331 ^36.914 ^0.036 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-8.892 ^36.971 ^5.790 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.267 ^37.029 ^2.820 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.731 ^37.086 ^11.516 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^5.894 ^37.143 ^6.712 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^8.405 ^37.200 ^2.405 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^7.188 ^37.257 ^-2.166 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^6.348 ^37.314 ^-7.435 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.859 ^37.371 ^-6.314 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-4.080 ^37.429 ^-8.752 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-4.786 ^37.486 ^-3.022 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-8.165 ^37.543 ^0.067 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.013 ^37.600 ^1.318 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-4.880 ^37.657 ^10.936 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.038 ^37.714 ^6.785 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.574 ^37.771 ^4.049 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.474 ^37.829 ^0.418 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^9.279 ^37.886 ^-2.822 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^5.907 ^37.943 ^-6.955 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.747 ^38.000 ^-5.593 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-2.708 ^38.057 ^-5.771 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-7.908 ^38.114 ^-4.965 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.145 ^38.171 ^0.012 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-8.685 ^38.229 ^5.718 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.388 ^38.286 ^0.875 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.507 ^38.343 ^3.258 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^6.511 ^38.400 ^7.339 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^7.979 ^38.457 ^2.240 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^12.574 ^38.514 ^-3.859 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.456 ^38.571 ^-1.723 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.173 ^38.629 ^-8.963 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.420 ^38.686 ^-7.241 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-3.549 ^38.743 ^-2.216 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.892 ^38.800 ^0.012 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-0.097 ^38.857 ^0.064 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-1.615 ^38.914 ^3.669 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.456 ^38.971 ^2.887 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.779 ^39.029 ^3.117 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.939 ^39.086 ^0.539 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.253 ^39.143 ^-0.388 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.946 ^39.200 ^-1.125 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.692 ^39.257 ^-5.393 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-5.579 ^39.314 ^-11.735 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-6.272 ^39.371 ^-3.894 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-11.926 ^39.429 ^0.189 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-4.175 ^39.486 ^2.779 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-5.322 ^39.543 ^12.174 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^0.075 ^39.600 ^0.469 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^6.326 ^39.657 ^7.058 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^3.025 ^39.714 ^0.833 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^2.278 ^39.771 ^-0.712 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^7.487 ^39.829 ^-8.951 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^1.095 ^39.886 ^-8.706 0 0 0 0 1 force @a
  particle campfire_signal_smoke ^-5.233 ^39.943 ^-10.935 0 0 0 0 1 force @a
}
