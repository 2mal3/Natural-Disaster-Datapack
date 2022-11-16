import ../../../macros/log.mcm


## API hooks
dir api {
  # Registers the natural disaster
  function register {
    function nadi:api/v1/register
    scoreboard players operation $blizzard nadi.blizzard = .out0 nadi.data
  }

  # Starts the natural disaster when selected
  function select {
    execute if score .out0 nadi.data = $blizzard nadi.blizzard run function nadi:disasters/blizzard/api/start
  }

  # Starts the natural disaster only if it is not yet active
  function start {
    execute if score %active nadi.blizzard matches 0 run function nadi:disasters/blizzard/start
  }

  function install {
    scoreboard objectives add nadi.blizzard dummy
    scoreboard objectives add nadi.blizzard.soundTime dummy

    scoreboard players set %time nadi.blizzard 0
    scoreboard players set %active nadi.blizzard 0

    scoreboard players set $enabled nadi.blizzard 1
    scoreboard players set $minTime nadi.blizzard 15
    scoreboard players set $maxTime nadi.blizzard 20
  }

  function uninstall {
    scoreboard objectives remove nadi.blizzard
    scoreboard objectives remove nadi.blizzard.soundTime
  }
}


## Disaster
function start {
  log NaturalDisaster info server <Start blizzard>
  scoreboard players set %active nadi.blizzard 1
  scoreboard players set %disasterActive nadi.data 1

  # Generate a random duration for the disaster
  scoreboard players operation .in0 nadi.data = $minTime nadi.blizzard
  scoreboard players operation .in1 nadi.data = $maxTime nadi.blizzard
  function nadi:utilities/random
  scoreboard players operation %time nadi.blizzard = .out0 nadi.data

  # Start diaster loops
  schedule function nadi:disasters/blizzard/clock/minute 60s replace
  schedule function nadi:disasters/blizzard/clock/second 1s replace
  schedule function nadi:disasters/blizzard/clock/tick_ 1t replace
}

function stop {
  log NaturalDisaster info server <Stop blizzard>
  scoreboard players set %active nadi.blizzard 0
  scoreboard players set %disasterActive nadi.data 0

  scoreboard players set %time nadi.blizzard 0

  # Stop diaster loops
  schedule clear nadi:disasters/blizzard/clock/minute
  schedule clear nadi:disasters/blizzard/clock/second
  schedule clear nadi:disasters/blizzard/clock/tick_
}


# Clocks
dir clock {
  function tick_ {
    schedule function $block 1t replace

    execute as @a[predicate=nadi:utilities/in_overworld,predicate=check_sky:check_sky_rain] at @s run {
      # Snow particle effects
      particle minecraft:falling_dust minecraft:snow_block ~ ~3.5 ~ 5 1 5 1 6 normal @s
      particle minecraft:falling_dust minecraft:snow_block ~ ~6.5 ~ 5 0.5 5 1 8 normal @s
      particle minecraft:falling_dust minecraft:snow_block ~ ~7.5 ~ 10 1 10 1 10 normal @s

      # Move the player to one side to simulate the wind
      # execute if entity @s[gamemode=!spectator] if block ~-0.4 ~ ~ #nadi:utilities/air_like if block ~-0.4 ~1 ~ #nadi:utilities/air_like if block ~-0.4 ~ ~-0.3 #nadi:utilities/air_like if block ~-0.4 ~1 ~-0.3 #nadi:utilities/air_like if block ~-0.4 ~ ~0.3 #nadi:utilities/air_like if block ~-0.4 ~1 ~0.3 #nadi:utilities/air_like run tp @s ~-0.05 ~ ~
    }
  }

  function second {
    schedule function $block 1s replace

    execute as @a[predicate=nadi:utilities/in_overworld,gamemode=!spectator] at @s run {
      # Effects
      execute if predicate check_sky:check_sky_rain run {
        # Potion effects
        # effect give @s minecraft:blindness 3 0 true
        # effect give @s minecraft:slowness 3 0 true

        # Wind sound loop
        execute unless score @s nadi.blizzard.soundTime matches 1.. run {
          scoreboard players set @s nadi.blizzard.soundTime 19
          playsound minecraft:item.elytra.flying master @s ~ ~ ~ 999999 0
        }
        scoreboard players remove @s nadi.blizzard.soundTime 1
      }

      # Falling snow
      LOOP(100, i) {
        summon minecraft:marker ~ ~ ~ {Tags: ["nadi.snow"]}
      }
      spreadplayers ~ ~ 2 64 false @e[type=minecraft:marker,tag=nadi.snow,distance=..1]
    }
    execute as @e[type=minecraft:marker,tag=nadi.snow] at @s run {
      name test

      execute if block ~ ~-0.1 ~ #nadi:disasters/blizzard/replace positioned ~ ~-0.1 ~ run function nadi:disasters/blizzard/place
      execute unless block ~ ~-0.1 ~ #nadi:disasters/blizzard/replace positioned ~ ~ ~ run function nadi:disasters/blizzard/place

    }
  }

  function minute {
    schedule function $block 60s replace

    # Count time and stop the disaster
    scoreboard players remove %time nadi.blizzard 1
    execute if score %time nadi.blizzard matches 0 run function nadi:disasters/blizzard/stop
  }
}

blocks replace {
  minecraft:snow
  \#minecraft:flowers
  minecraft:tall_grass
  minecraft:grass
}

blocks snow {
  minecraft:snow
  minecraft:powder_snow
}

# Increases the snow level of a block by one
function place {
  execute if block ~ ~ ~ minecraft:snow[layers=7] run setblock ~ ~ ~ minecraft:powder_snow
  execute if block ~ ~ ~ minecraft:snow[layers=6] run setblock ~ ~ ~ minecraft:snow[layers=7]
  execute if block ~ ~ ~ minecraft:snow[layers=5] run setblock ~ ~ ~ minecraft:snow[layers=6]
  execute if block ~ ~ ~ minecraft:snow[layers=4] run setblock ~ ~ ~ minecraft:snow[layers=5]
  execute if block ~ ~ ~ minecraft:snow[layers=3] run setblock ~ ~ ~ minecraft:snow[layers=4]
  execute if block ~ ~ ~ minecraft:snow[layers=2] run setblock ~ ~ ~ minecraft:snow[layers=3]
  execute if block ~ ~ ~ minecraft:snow[layers=1] run setblock ~ ~ ~ minecraft:snow[layers=2]
  execute unless block ~ ~ ~ #nadi:disasters/blizzard/snow run setblock ~ ~ ~ minecraft:snow[layers=1]
}
