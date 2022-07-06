import ../../../macros/log.mcm


## API hooks
dir api {
  # Registers the natural disaster
  function register {
    function nadi:api/register
    scoreboard players operation $thunderstorm nadi.disasters = .out0 nadi.data
  }

  # Starts the natural disaster when selected
  function select {
    execute if score .out0 nadi.data = $thunderstorm nadi.disasters run function nadi:disasters/thunderstorm/start
  }
}


## Disaster
function start {
  log NaturalDisaster info server <Start thunderstorm>

  # Generate a random duration for the disaster
  scoreboard players set .in0 nadi.data 10
  scoreboard players set .in1 nadi.data 15
  function nadi:utilities/random
  scoreboard players operation %disasterTime nadi.data = .out0 nadi.data

  # Disable sleeping
  scoreboard players set %preventSleep nadi.data 1
  # Set weather to thunder
  weather thunder 999999

  # Start clocks
  schedule function nadi:disasters/thunderstorm/clock/minute 60s replace
  schedule function nadi:disasters/thunderstorm/clock/second 1s replace
}

function stop {
  log NaturalDisaster info server <Stop thunderstorm>

  scoreboard players set %disasterTime nadi.data 0

  # Enable sleeping
  scoreboard players set %preventSleep nadi.data 0
  # Clear weather
  weather clear

  # Stop clocks
  schedule clear nadi:disasters/thunderstorm/clock/minute
  schedule clear nadi:disasters/thunderstorm/clock/second
}

# Clocks
dir clock {
  function second {
    schedule function $block 1s replace

    execute as @a[gamemode=!spectator,predicate=nadi:utilities/in_overworld] at @s if predicate nadi:utilities/random/30 run {
      summon minecraft:area_effect_cloud ~ ~ ~ {Tags: [nadi.thunderstorm]}
      execute as @e[type=minecraft:area_effect_cloud,tag=nadi.thunderstorm,distance=..1] at @s run {
        spreadplayers ~ ~ 0 64 true @s
        execute at @s run summon minecraft:lightning_bolt ~ ~ ~
      }
    }
  }

  function minute {
    schedule function $block 60s replace

    # Count time
    scoreboard players remove %disasterTime nadi.data 1
    execute if score %disasterTime nadi.data matches 0 run function nadi:disasters/thunderstorm/stop
  }
}
