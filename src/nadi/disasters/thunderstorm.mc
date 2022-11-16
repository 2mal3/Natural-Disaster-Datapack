import ../../../macros/log.mcm


## API hooks
dir api {
  # Registers the natural disaster
  function register {
    function nadi:api/v1/register
    scoreboard players operation $thunderstorm nadi.thunderstorm = .out0 nadi.data
  }

  # Starts the natural disaster when selected
  function select {
    execute if score .out0 nadi.data = $thunderstorm nadi.thunderstorm run function nadi:disasters/thunderstorm/api/start
  }

  # Starts the natural disaster only if it is not yet active
  function start {
    execute if score %active nadi.thunderstorm matches 0 run function nadi:disasters/thunderstorm/start
  }

  function install {
    scoreboard objectives add nadi.thunderstorm dummy

    scoreboard players set %time nadi.thunderstorm 0
    scoreboard players set %active nadi.thunderstorm 0

    scoreboard players set $enabled nadi.thunderstorm 1
    scoreboard players set $minTime nadi.thunderstorm 20
    scoreboard players set $maxTime nadi.thunderstorm 30
  }

  function uninstall {
    scoreboard objectives remove nadi.thunderstorm
  }
}


## Disaster
function start {
  log NaturalDisaster info server <Start thunderstorm>
  scoreboard players set %active nadi.thunderstorm 1
  scoreboard players set %disasterActive nadi.data 0

  # Generate a random duration for the disaster
  scoreboard players operation .in0 nasibu = $minTime nadi.thunderstorm
  scoreboard players operation .in1 nasibu = $maxTime nadi.thunderstorm
  function nasibu:random
  scoreboard players operation %time nadi.thunderstorm = .out0 nasibu

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
  scoreboard players set %active nadi.thunderstorm 0
  scoreboard players set %disasterActive nadi.data 0

  scoreboard players set %time nadi.thunderstorm 0

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
      summon minecraft:marker ~ ~ ~ {Tags: [nadi.thunderstorm]}
      execute as @e[type=minecraft:marker,tag=nadi.thunderstorm,distance=..1] at @s run {
        spreadplayers ~ ~ 0 64 true @s
        execute at @s run summon minecraft:lightning_bolt ~ ~ ~
      }
    }
  }

  function minute {
    schedule function $block 60s replace

    # Count time
    scoreboard players remove %time nadi.thunderstorm 1
    execute if score %time nadi.thunderstorm matches 0 run function nadi:disasters/thunderstorm/stop
  }
}
