import ../../../macros/log.mcm


## API hooks
dir api {
  # Registers the natural disaster
  function register {
    function nadi:api/register
    scoreboard players operation $hail nadi.hail = .out0 nadi.data
  }

  # Starts the natural disaster when selected
  function select {
    execute if score .out0 nadi.data = $hail nadi.hail run function nadi:disasters/hail/start
  }

  function install {
    scoreboard objectives add nadi.hail dummy

    scoreboard players set %time nadi.hail 0
    scoreboard players set %active nadi.hail 0

    scoreboard players set $enabled nadi.hail 1
    scoreboard players set $minTime nadi.hail 10
    scoreboard players set $maxTime nadi.hail 15
  }

  function uninstall {
    scoreboard objectives remove nadi.hail
  }
}


## Disaster
function start {
  log NaturalDisaster info server <Start hail>
  scoreboard players set %active nadi.hail 1
  scoreboard players set %disasterActive nadi.data 1

  # Generate a random duration for the disaster
  scoreboard players operation .in0 nadi.data = $minTime nadi.hail
  scoreboard players operation .in1 nadi.data = $maxTime nadi.hail
  function nadi:utilities/random
  scoreboard players operation %time nadi.hail = .out0 nadi.data

  # Disable sleeping
  scoreboard players set %preventSleep nadi.data 1
  # Set weather to thunder
  weather rain 999999

  # Start diaster loops
  schedule function nadi:disasters/hail/clock/minute 60s replace
  schedule function nadi:disasters/hail/clock/second 1s replace
  schedule function nadi:disasters/hail/clock/tick_ 1t replace
}

function stop {
  log NaturalDisaster info server <Stop hail>
  scoreboard players set %active nadi.hail 0
  scoreboard players set %disasterActive nadi.data 0

  scoreboard players set %time nadi.hail 0

  # Enable sleeping
  scoreboard players set %preventSleep nadi.data 0
  # Clear weather
  weather clear

  # Remove all remaining entities from the hail
  kill @e[type=minecraft:falling_block]
  kill @e[type=minecraft:marker,tag=nadi.hail]

  # Stop diaster loops
  schedule clear nadi:disasters/hail/clock/minute
  schedule clear nadi:disasters/hail/clock/second
  schedule clear nadi:disasters/hail/clock/tick_
}


# Clocks
dir clock {
  function tick_ {
    schedule function $block 1t replace

    # Removes the hailstone when it has fallen to the ground so that not the whole world is covered with hail
    # Removes only a few hailstones per tick so that they are not all removed at the same time, which sounds better
    execute as @a[predicate=nadi:utilities/in_overworld,gamemode=!spectator] as @e[type=minecraft:marker,tag=nadi.hail,tag=!nadi.init,predicate=nadi:disasters/hail/in_ice,sort=random,limit=3] at @s run {
      kill @s
      setblock ~ ~ ~ minecraft:air
      playsound minecraft:block.note_block.hat ambient @a ~ ~ ~ 1 0
      particle minecraft:block minecraft:ice ~ ~0.5 ~ 0.25 0.25 0.25 1 30
    }
  }

  function second {
    schedule function $block 1s replace

    # Creates a new hailstone
    execute as @a[predicate=nadi:utilities/in_overworld,gamemode=!spectator] at @s run {
      LOOP(50, i) {
        summon minecraft:marker ~ ~ ~ {Tags: ["nadi.hail", "nadi.init", "global.ignore"]}
      }
      spreadplayers ~ ~ 2 32 false @e[type=minecraft:marker,tag=nadi.hail,distance=..1]
    }

    execute as @e[type=minecraft:marker,tag=nadi.hail,tag=nadi.init] at @s run {
      tag @s remove nadi.init
      summon falling_block ~ 319 ~ {BlockState: {Name: "minecraft:ice"}, Time: 1, HurtEntities: 1b, FallHurtMax: 30, FallHurtAmount: 2f}
    }
  }

  function minute {
    schedule function $block 60s replace

    # Count time and stop the disaster
    scoreboard players remove %time nadi.hail 1
    execute if score %time nadi.hail matches 0 run function nadi:disasters/hail/stop
  }
}

predicate in_ice {
  "condition": "minecraft:location_check",
  "predicate": {
    "block": {
      "blocks": [
        "minecraft:ice"
      ]
    }
  }
}
