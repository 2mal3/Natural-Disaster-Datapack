import ../../../macros/log.mcm


## API hooks
dir api {
  # Registers the natural disaster
  function register {
    function nadi:api/register
    scoreboard players operation $acidRain nadi.acidRain = .out0 nadi.data
  }

  # Starts the natural disaster when selected
  function select {
    execute if score .out0 nadi.data = $acidRain nadi.acidRain run function nadi:disasters/acid_rain/start
  }

  function install {
    scoreboard objectives add nadi.acidRain dummy

    scoreboard players set %time nadi.acidRain 0
    scoreboard players set %active nadi.acidRain 0

    scoreboard players set $enabled nadi.acidRain 1
    scoreboard players set $minTime nadi.acidRain 10
    scoreboard players set $maxTime nadi.acidRain 15
  }

  function uninstall {
    scoreboard objectives remove nadi.acidRain
  }
}


## Start / Stop
function start {
  log NaturalDisaster info server <Start acid rain>
  scoreboard players set %active nadi.acidRain 1
  scoreboard players set %disasterActive nadi.data 1

  # Generate a random duration for the disaster
  scoreboard players operation .in0 nadi.data = $minTime nadi.acidRain
  scoreboard players operation .in1 nadi.data = $maxTime nadi.acidRain
  function nadi:utilities/random
  scoreboard players operation %time nadi.acidRain = .out0 nadi.data

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
  scoreboard players set %active nadi.acidRain 0
  scoreboard players set %disasterActive nadi.data 0

  scoreboard players set %time nadi.acidRain 0

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

    # Gives poisoning to any creature that can be reached by the rain to simulate the etching effect
    execute as @e[team=!thisTeamDoesNotExist,predicate=nadi:utilities/in_overworld,predicate=check_sky:check_sky_rain] run effect give @s minecraft:wither 5 1 true

    # If players wear a helmet, however, they do not receive any damage because the helmet keeps the acid away
    execute as @a[predicate=nadi:disasters/acid_rain/has_wither,predicate=nadi:disasters/acid_rain/wears_helmet] run {
      effect clear @s minecraft:wither

      # Helmets of players in creative mode and spectator mode are not destroyed, as the players are not affected by the effects anyway
      execute if entity @s[gamemode=!spectator,gamemode=!creative] run {
        execute store result score .temp0 nadi.data run data get entity @s Inventory[{Slot: 103b}].tag.Damage
        scoreboard players add .temp0 nadi.data 1
        execute store result storage nadi:data root.temp int 1 run scoreboard players get .temp0 nadi.data
        item modify entity @s armor.head nadi:disasters/acid_rain/store_damage
      }
    }
  }

  function minute {
    schedule function $block 60s replace

    # Count time
    scoreboard players remove %time nadi.acidRain 1
    execute if score %time nadi.acidRain matches 0 run function nadi:disasters/acid_rain/stop
  }
}


predicate has_wither {
  "condition": "minecraft:entity_properties",
  "entity": "this",
  "predicate": {
    "effects": {
      "minecraft:wither": {}
    }
  }
}

predicate wears_helmet {
  "condition": "minecraft:entity_properties",
  "entity": "this",
  "predicate": {
    "equipment": {
      "head": {
        "tag": "nadi:disasters/acid_rain/helmet"
      }
    }
  }
}

items helmet {
  minecraft:leather_helmet
  minecraft:iron_helmet
  minecraft:chainmail_helmet
  minecraft:golden_helmet
  minecraft:diamond_helmet
  minecraft:netherite_helmet
  minecraft:turtle_helmet
}

modifier store_damage {
  "function": "minecraft:copy_nbt",
  "source": {
    "type": "minecraft:storage",
    "source": "nadi:data"
  },
  "ops": [
    {
      "source": "root.temp",
      "target": "Damage",
      "op": "replace"
    }
  ]
}

# Blocks that cannot be destroyed by acid rain because they are either technical blocks or cannot otherwise be destroyed by the player
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
