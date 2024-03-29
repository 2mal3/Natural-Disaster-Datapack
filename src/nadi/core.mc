import ../../macros/log.mcm


function random_time {
  scoreboard players operation .in0 nasibu = $minTime nadi.data
  scoreboard players operation .in1 nasibu = $maxTime nadi.data
  function nasibu:random
  scoreboard players operation %time nadi.data = .out0 nasibu
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
    function #nadi:api/v1/select

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
  execute unless score %installed nadi.data matches 1 run function nadi:core/install
  execute if score %installed nadi.data matches 1 unless score $version nadi.data matches <%config.version.int%> run {
    log NaturalDisaster info server <Updated datapack>
    scoreboard players set $version nadi.data <%config.version.int%>
  }

  # Init disasters
  scoreboard players set %disasterCount nadi.data 0
  function #nadi:api/v1/register
}

function install {
  log NaturalDisaster info server <Datapack installed>
  scoreboard players set %installed nadi.data 1

  # Add scoreboards
  scoreboard objectives add nadi.data dummy
  scoreboard objectives add nadi.challangeMode trigger "Challange Mode"
  scoreboard objectives add 2mal3.debugMode dummy
  # Set the version in format: xx.xx.xx
  scoreboard players set $version nadi.data <%config.version.int%>
  # Init variables
  scoreboard players set %preventSleep nadi.data 0
  scoreboard players set %disasterActive nadi.data 0
  scoreboard players set %firstPlayerJoin nadi.data 0
  # Init config
  scoreboard players set $minTime nadi.data 140
  scoreboard players set $maxTime nadi.data 600
  # Create storage
  #declare storage nadi:data
  data merge storage nadi:data {root: {temp: 0}}

  # Install natural disasters
  function #nadi:api/v1/install

  # Generate a first start time
  function nadi:core/random_time

  # Start main clock
  schedule function nadi:core/clock 60s replace

  # Sent installation message after 4 seconds
  schedule 4s replace {
    tellraw @a {"text":"Natural Disaster Datapack <%config.version.str%> by 2mal3 was installed!","color":"green"}
  }
}

function first_join {
  # Only send the messages to the first player that joins the world
  execute if score %firstPlayerJoin nadi.data matches 0 run {
    scoreboard players set %firstPlayerJoin nadi.data 1
    function nadi:menu/pages/challenge_mode
  }
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
    "title": "Natural Disaster <%config.version.str%>",
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

function reinstall {
  log NaturalDisaster info server <Datapack reinstalled>

  # Stop loops
  schedule clear nadi:core/clock
  # Stop natural disasters
  function #nadi:api/v1/stop
  # Uninstall natural disasters
  function #nadi:api/v1/uninstall
  # Deletes the scoreboards
  scoreboard objectives remove nadi.data
  scoreboard objectives remove 2mal3.debugMode
  # Deletes storage
  data remove storage nadi:data root

  # Installs the datapack after a second
  schedule 1s replace {
    function nadi:core/install
  }
}

function uninstall {
  log NaturalDisaster info server <Datapack uninstalled>

  # Stop loops
  schedule clear nadi:core/clock
  # Stop natural disasters
  function #nadi:api/v1/stop
  # Uninstall natural disasters
  function #nadi:api/v1/uninstall
  # Deletes the scoreboards
  scoreboard objectives remove nadi.data
  scoreboard objectives remove nadi.challangeMode
  scoreboard objectives remove 2mal3.debugMode
  # Deletes storage
  data remove storage nadi:data root

  # Sends an uninstallation message to all players
  tellraw @a {"text":"Natural Disaster Datapack <%config.version.str%> by 2mal3 was successfully uninstalled.","color": "green"}

  # Disables the datapack
  datapack disable "file/Natural-Disaster-Datapack"
  datapack disable "file/Natural-Disaster-Datapack.zip"
}
