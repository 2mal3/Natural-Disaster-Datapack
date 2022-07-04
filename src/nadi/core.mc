import ../../macros/log.mcm


function random_time {
  scoreboard players set .in0 nadi.data 140
  scoreboard players set .in1 nadi.data 600
  function nadi:utilities/random
  scoreboard players operation %time nadi.data = .out0 nadi.data
}


## Main datapack loop
function clock {
  schedule function $block 60s replace

  # Count the time only if a player is on the server
  execute if entity @a[gamemode=!spectator] run scoreboard players remove %time nadi.data 1

  # Starts a random disaster after the time runs out and if a player is in a valid position for a disaster
  execute if score %time nadi.data matches ..0 run {
    # Selects a random disaster id from the existing disasters
    name select
    log NaturalDisaster info server <Select a random disaster>

    scoreboard players set .in0 nadi.data 1
    scoreboard players operation .in1 nadi.data = %disasterCount nadi.data
    function nadi:utilities/random
    function #nadi:api/select

    # Generate a new random time
    function nadi:core/random_time
  }
}


## Commands to load up the datapack
function load {
  log NaturalDisaster info server <Datapack reloaded>

  scoreboard objectives add nadi.data dummy

  # scoreboard players set %installed nadi.data 0
  # Initializes the datapack at the first startup or new version
  execute unless score %installed nadi.data matches 1 run {
    log NaturalDisaster info server <Datapack installed>
    scoreboard players set %installed nadi.data 1

    # Add scoreboards
    scoreboard objectives add nadi.data dummy
    scoreboard objectives add nadi.disasters dummy
    scoreboard objectives add 2mal3.debugMode dummy
    scoreboard objectives add nadi.blizzard.soundTime dummy
    # Set the version in format: xx.xx.xx
    scoreboard players set $version nadi.data 030000
    # Init variables
    scoreboard players set %disasterTime nadi.data 0
    scoreboard players set %preventSleep nadi.data 0
    # Set up random number generator
    execute store result score .rng nadi.data run seed
    scoreboard players set $65536 nadi.data 65536
    scoreboard players set $rng.multiplier nadi.data 1664525
    scoreboard players set $rng.increment nadi.data 1013904223
    scoreboard players set .rng.bitSwap nadi.data 0
    # Create storage
    #declare storage nadi:data
    data merge storage nadi:data {root: {temp: 0}}

    # Generate a first start time
    function nadi:core/random_time

    # Init disasters
    scoreboard players set %disasterCount nadi.data 0
    scoreboard players reset * nadi.disasters
    function #nadi:api/register

    # Start main clock
    function nadi:core/clock

    # Sent installation message after 4 seconds
    schedule 4s replace {
      tellraw @a {"text":"Natural Disaster Datapack v3.0.0 by 2mal3 was installed!","color":"green"}
    }
  }
  execute if score %installed nadi.data matches 1 unless score $version nadi.data matches 030000 run {
    log NaturalDisaster info server <Updated datapack>
    scoreboard players set $version nadi.data 030000
  }
}

function first_join {
  ## Warns the player if he uses a not supported minecraft version
  execute store result score .temp0 nadi.data run data get entity @s DataVersion
  execute unless score .temp0 nadi.data matches 3095.. run tellraw @s [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"gold"},{"text":"/","color":"gray"},{"text":"WARN","color":"gold"},{"text": "/","color": "gray"},{"text": "Server","color": "gold"},{"text":"]: ","color":"gray"},{"text":"This Minecraft version is not supported by the datapack. Please use the 1.18.x to prevent errors.","color":"gold"}]
}

advancement first_join {
  "criteria": {
      "requirement": {
          "trigger": "minecraft:tick"
      }
  },
  "rewards": {
      "function": "nadi:core/first_join"
  }
}

advancement nadi {
  "display": {
    "title": "Natural Disaster v3.0.0",
    "description": "<datapack description>",
    "icon": {
      "item": "minecraft:lava_bucket"
    },
    "announce_to_chat": false,
    "show_toast": false
  },
  "parent": "global:2mal3",
  "criteria": {
    "trigger": {
      "trigger": "minecraft:tick"
    }
  }
}

function uninstall {
  log NaturalDisaster info server <Datapack uninstalled>

  # Deletes the scoreboards
  scoreboard objectives remove nadi.data
  scoreboard objectives remove nadi.disasters
  scoreboard objectives remove 2mal3.debugMode
  scoreboard objectives remove nadi.blizzard.soundTime
  # Deletes storage
  data remove storage nadi:data root

  # Sends an uninstallation message to all players
  tellraw @a {"text":"Natural Disaster Datapack v3.0.0 by 2mal3 was successfully uninstalled.","color": "green"}

  # Disables the datapack
  datapack disable "file/Natural-Disaster-Datapack"
  datapack disable "file/Natural-Disaster-Datapack-v3.0.0"
  datapack disable "file/Natural-Disaster-Datapack-v3.0.0.zip"
}
