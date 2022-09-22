import ../../../macros/log.mcm


## API hooks
dir api {
  function register {
    function nadi:api/register
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
    summon minecraft:wandering_trader ~ ~ ~ {Silent:1b,Invulnerable:1b,PersistenceRequired:1b,Offers:{},UUID:[I;-2122687629,1586971322,-1393919644,1659431836],Tags:["nadi.hurricane"]}
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
  summon minecraft:falling_block ~ ~1 ~ {Tags:[nadi.init,nadi.block], NoGravity:1b}
  execute as @e[type=minecraft:falling_block,tag=nadi.block,tag=nadi.init] run {
    tag @s remove nadi.init

    data modify entity @s BlockState.Name set from entity @e[type=minecraft:item,limit=1,sort=nearest] Item.id
    kill @e[type=minecraft:item,limit=1,sort=nearest]

    # Shortly teleport the block outside of the render distance of the player to refresh the texture of the block
    execute at @s run tp @s ~1000 ~ ~
    execute at @s run tp @s ~-1000 ~ ~
  }
}


# Clocks
dir clock {
  function tick_ {
    schedule function $block 1t replace

    execute as 817a5b73-5e97-42ba-acea-796462e8eb9c at @s run {
      particle minecraft:campfire_cosy_smoke ~ ~ ~ 0 5 0 0 5 force @a[distance=..64]

      execute as @e[distance=..42,tag=!nadi.hurricane,team=!thisTeamDoesNotExists] at @s run {
        # Mover every entity in a spiral pattern to the center of the hurricane
        execute facing entity 817a5b73-5e97-42ba-acea-796462e8eb9c eyes run tp @s ^-0.3 ^0.1 ^

        # Damages entities in the center of the hurricane
        execute positioned ~-2 ~ ~-2 if entity @e[type=minecraft:wandering_trader,tag=nadi.hurricane,dx=4,dy=-50,dz=4] run effect give @s minecraft:wither 1 1 true
        # Prevent entities from falling down
        effect give @s minecraft:levitation 1 255 true
      }

      execute as @e[type=minecraft:falling_block,distance=..64] at @s facing entity 817a5b73-5e97-42ba-acea-796462e8eb9c eyes run tp @s ^-0.3 ^0.2 ^
    }

    # Airtoggle tha falling blocks so they move visualy smoothly
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
        summon minecraft:marker ~ ~ ~ {UUID:[I;-1077254131,190991498,-1310968309,-1204122309]}
        spreadplayers ~ ~ 0 32 false bfca680d-0b62-4c8a-b1dc-360bb83a8d3b
        execute as bfca680d-0b62-4c8a-b1dc-360bb83a8d3b at @s run {
          summon minecraft:creeper ~ ~ ~ {Fuse:0}
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
        summon minecraft:marker ~ ~ ~ {UUID:[I;-1957186480,1325289214,-2056032507,-1780198330]}
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
