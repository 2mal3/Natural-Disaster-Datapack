import ../../macros/log.mcm


## Random number generator
function random {
  # Generate random number
  scoreboard players operation .rng nadi.random *= $multiplier nadi.random
  scoreboard players operation .rng nadi.random += $increment nadi.random

  # Swap bits
  scoreboard players operation .bitSwap nadi.random = .rng nadi.random
  scoreboard players operation .bitSwap nadi.random /= $65536 nadi.random
  scoreboard players operation .rng nadi.random *= $65536 nadi.random
  scoreboard players operation .rng nadi.random += bitSwap nadi.random

  # Return output
  scoreboard players operation .temp0 nadi.data = .in1 nadi.data
  scoreboard players operation .temp0 nadi.data -= .in0 nadi.data
  scoreboard players add .temp0 nadi.data 1
  scoreboard players operation .out0 nadi.data = .rng nadi.random
  scoreboard players operation .out0 nadi.data %= .temp0 nadi.data
  scoreboard players operation .out0 nadi.data += .in0 nadi.data
}


## Random predicates
dir random {
  predicate 20 {
    "condition": "minecraft:random_chance",
    "chance": 0.2
  }

  predicate 30 {
    "condition": "minecraft:random_chance",
    "chance": 0.3
  }

  predicate 50 {
    "condition": "minecraft:random_chance",
    "chance": 0.5
  }
}


## Prevent sleeping in a bed
dir prevent_sleep {
  function sleep {
    advancement revoke @s only nadi:utilities/prevent_sleep/sleep

    execute if score %preventSleep nadi.data matches 1.. run {
      log NaturalDisaster debug entity <Prevent sleep>

      title @s actionbar {"text": "You can't sleep now"}
      # Stops the sleeping by teleporting the player to itself
      tp @s ~ ~ ~
    }
  }

  advancement sleep {
    "criteria": {
      "requirement": {
        "trigger": "minecraft:slept_in_bed"
      }
    },
    "rewards": {
      "function": "nadi:utilities/prevent_sleep/sleep"
    }
  }
}


## Predicates
predicate in_overworld {
  "condition": "minecraft:location_check",
  "predicate": {
    "dimension": "minecraft:overworld"
  }
}


## Block tags
blocks air_like {
  minecraft:air
  minecraft:cave_air
  \#minecraft:flowers
  minecraft:grass
  minecraft:tall_grass
}
