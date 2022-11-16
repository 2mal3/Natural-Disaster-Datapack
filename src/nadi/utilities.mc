import ../../macros/log.mcm


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
