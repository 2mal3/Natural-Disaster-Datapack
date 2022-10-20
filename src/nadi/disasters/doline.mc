import ../../../macros/log.mcm


## API hooks
dir api {
  # Registers the natural disaster
  function register {
    function nadi:api/v1/register
    scoreboard players operation $doline nadi.doline = .out0 nadi.data
  }

  # Starts the natural disaster when selected
  function select {
    execute if score .out0 nadi.data = $doline nadi.doline run function nadi:disasters/doline/api/start
  }

  # Starts the natural disaster only if it is not yet active
  function start {
    execute if score %active nadi.doline matches 0 run function nadi:disasters/doline/start
  }

  function install {
    scoreboard objectives add nadi.doline dummy

    scoreboard players set %depth nadi.doline 0
    scoreboard players set %active nadi.doline 0

    scoreboard players set $enabled nadi.doline 1
    scoreboard players set $minDepth nadi.doline 15
    scoreboard players set $maxDepth nadi.doline 30
  }

  function uninstall {
    scoreboard objectives remove nadi.doline
  }
}


## Disaster
function start {
  log NaturalDisaster info server <Start doline>
  scoreboard players set %active nadi.doline 1
  scoreboard players set %disasterActive nadi.data 1

  # Generate a random duration for the disaster
  scoreboard players operation .in0 nadi.data = $minDepth nadi.doline
  scoreboard players operation .in1 nadi.data = $maxDepth nadi.doline
  function nadi:utilities/random
  scoreboard players operation %depth nadi.doline = .out0 nadi.data

  # f9764ddd-6ec6-4195-825a-cf4fcc4c437c
  execute as @r[gamemode=!spectator,predicate=nadi:utilities/in_overworld,predicate=nadi:disasters/doline/over_0] at @s run summon minecraft:marker ~ ~ ~ {UUID: [I; -109687331, 1858486677, -2107977905, -867417220]}
  # Creepy sound
  execute as f9764ddd-6ec6-4195-825a-cf4fcc4c437c at @s run playsound minecraft:ambient.cave ambient @a ~ ~ ~ 0.5

  # Start clocks
  schedule function nadi:disasters/doline/clock/5_tick 5t replace
}

function stop {
  log NaturalDisaster info server <Stop doline>
  scoreboard players set %active nadi.doline 0
  scoreboard players set %disasterActive nadi.data 0

  scoreboard players set %depth nadi.doline 0

  kill f9764ddd-6ec6-4195-825a-cf4fcc4c437c

  # Stop clocks
  schedule clear nadi:disasters/doline/clock/5_tick
}

# Clocks
dir clock {
  function 5_tick {
    schedule function $block 5t replace

    execute as f9764ddd-6ec6-4195-825a-cf4fcc4c437c at @s run {
      clone ~-7 ~-5 ~-7 ~7 ~30 ~7 ~-7 ~-6 ~-7 masked move
      playsound minecraft:entity.zombie.break_wooden_door master @a ~ ~ ~ 0.5

      # Damages all entities in the doline
      effect give @e[team=!thisTeamDoesNotExist,distance=..7] minecraft:wither 1 1 true

      # Remove duped items
      kill @e[type=minecraft:item,distance=..7,nbt={Age: 0s}]

      tp @s ~ ~-1 ~
      # Gives a random offset to make the hole look more destroyed
      execute if predicate nadi:utilities/random/50 at @s run tp @s ~0.5 ~ ~
      execute if predicate nadi:utilities/random/50 at @s run tp @s ~-0.5 ~ ~
      execute if predicate nadi:utilities/random/50 at @s run tp @s ~ ~ ~0.5
      execute if predicate nadi:utilities/random/50 at @s run tp @s ~ ~ ~-0.5
    }

    # Count depth of the doline
    scoreboard players remove %depth nadi.doline 1
    execute if score %depth nadi.doline matches 0 run function nadi:disasters/doline/stop

  }
}

predicate over_0 {
  "condition": "minecraft:location_check",
  "predicate": {
    "position": {
      "y": {
        "min": 0
      }
    }
  }
}
