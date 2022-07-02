import ../../../macros/log.mcm


## API hooks
dir api {
  # Registers the natural disaster
  function register {
    function nadi:api/register
    scoreboard players operation $acidRain nadi.disasters = .out0 nadi.data
  }

  # Starts the natural disaster when selected
  function select {
    execute if score .out0 nadi.data = $acidRain nadi.disasters run function nadi:disasters/acid_rain/start
  }
}


## Start / Stop
function start {
  log NaturalDisaster info server <Start acid rain>

  # Generate a random duration for the disaster
  scoreboard players set .in0 nadi.data 10
  scoreboard players set .in1 nadi.data 15
  function nadi:utilities/random
  scoreboard players operation %disasterTime nadi.data = .out0 nadi.data

  # Set weather to thunder
  weather rain 999999

  # Start clocks
  schedule function nadi:disasters/acid_rain/clock/minute 60s replace
  schedule function nadi:disasters/acid_rain/clock/5_second 5s replace
  schedule function nadi:disasters/acid_rain/clock/second 1s replace
  schedule function nadi:disasters/acid_rain/clock/tick_ 1t replace
}

function stop {
  log NaturalDisaster info server <Stop acid rain>

  # Clear weather
  weather clear

  # Stop clocks
  schedule clear nadi:disasters/acid_rain/clock/minute
  schedule clear nadi:disasters/acid_rain/clock/5_second
  schedule clear nadi:disasters/acid_rain/clock/second
  schedule clear nadi:disasters/acid_rain/clock/tick_
}


## Clocks
dir clock {
  function tick_ {
    schedule function $block 1t replace

    execute as @a[predicate=nadi:utilities/in_overworld,predicate=check_sky:check_sky_rain] at @s run {
      particle minecraft:falling_dust minecraft:slime_block ~ ~3.5 ~ 5 1 5 1 3 normal @s
      particle minecraft:falling_dust minecraft:slime_block ~ ~6.5 ~ 5 0.5 5 1 4 normal @s
      particle minecraft:falling_dust minecraft:slime_block ~ ~7.5 ~ 10 1 10 1 5 normal @s
    }
  }

  function second {
    schedule function $block 1s replace

    # Removes blocks from the overword surface
    execute as @a[predicate=nadi:utilities/in_overworld,gamemode=!spectator] at @s run {
      LOOP(10, i) {
        summon minecraft:area_effect_cloud ~ ~ ~ {Tags: ["nadi.acidRain"]}
      }
      spreadplayers ~ ~ 1 64 false @e[type=minecraft:area_effect_cloud,tag=nadi.acidRain,distance=..1]
      execute as @e[type=minecraft:area_effect_cloud,tag=nadi.acidRain,distance=..1] at @s positioned ~-1 ~-1 ~-1 run {
        LOOP(3, x) {
          LOOP(3, y) {
            execute positioned ~<%x%> ~ ~<%y%> unless block ~ ~ ~ #nadi:disasters/acid_rain/ignore if block ~ ~1 ~ #nadi:utilities/air_like run setblock ~ ~ ~ minecraft:air
          }
        }
        # Some fancy effects
        playsound minecraft:block.lava.extinguish weather @a ~ ~ ~ 0.5 2
        particle minecraft:smoke ~ ~0.5 ~ 1 0.1 1 0 50 force @a[distance=..64]
      }
    }
  }

  function 5_second {
    schedule function $block 5s replace

    execute as @e[team=!thisTeamDoesNotExist,predicate=nadi:utilities/in_overworld,predicate=check_sky:check_sky_rain] run effect give @s minecraft:wither 5 1 true
  }

  function minute {
    schedule function $block 60s replace

    # Count time
    scoreboard players remove %disasterTime nadi.data 1
    execute if score %disasterTime nadi.data matches 0 run function nadi:disasters/acid_rain/stop
  }
}

blocks ignore {
  minecraft:barrier
  minecraft:bedrock
  minecraft:end_portal
  minecraft:end_portal_frame
  minecraft:end_gateway
  minecraft:command_block
  minecraft:repeating_command_block
  minecraft:chain_command_block
  minecraft:structure_block
  minecraft:jigsaw
  minecraft:obsidian
  minecraft:crying_obsidian
  minecraft:end_stone
  minecraft:reinforced_deepslate
}
