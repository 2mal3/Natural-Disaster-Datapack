import ../../../macros/log.mcm


## API hooks
dir api {
  # Registers the natural disaster
  function register {
    function nadi:api/register
    scoreboard players operation $meteoroid nadi.meteoroid = .out0 nadi.data
  }

  # Starts the natural disaster when selected
  function select {
    execute if score .out0 nadi.data = $meteoroid nadi.meteoroid run function nadi:disasters/meteoroid/api/start
  }

  # Starts the natural disaster only if it is not yet active
  function start {
    execute if score %active nadi.meteoroid matches 0 run function nadi:disasters/meteoroid/start
  }

  function install {
    scoreboard objectives add nadi.meteoroid dummy

    scoreboard players set %active nadi.meteoroid 0

    scoreboard players set $enabled nadi.meteoroid 1
  }

  function uninstall {
    scoreboard objectives remove nadi.meteoroid
  }
}


## Disaster
function start {
  log NaturalDisaster info server <Start meteorite>
  scoreboard players set %active nadi.meteoroid 1
  scoreboard players set %disasterActive nadi.data 1

  # Chooses a random player to spawn the meteoroid at
  execute as @r[gamemode=!spectator] at @s positioned ~ 300 ~ run {
    place template nadi:meteoroid/meteoroid ~-4 ~ ~-4
    # "910fb361-682f-4f5d-a98c-717fcc4c9bcc"
    summon minecraft:marker ~ ~4 ~ {UUID: [I; -1861242015, 1747930973, -1450413697, -867394612], Tags: ["global.ignore"]}
    summon minecraft:fireball ~ ~-16 ~ {ExplosionPower: 32b, power: [0.0d, -0.3d, 0.0d], Item: {id: "minecraft:air", Count: 1b}}
  }

  # Start the datapack clock
  function nadi:disasters/meteoroid/clock
}

function stop {
  scoreboard players set %active nadi.meteoroid 0
  scoreboard players set %disasterActive nadi.data 0

  execute as 910fb361-682f-4f5d-a98c-717fcc4c9bcc at @s run {
    clone ~-4 ~-4 ~-4 ~4 ~4 ~4 ~-4 ~-8 ~-4 masked move
    kill @s
  }
}

function clock {
  schedule function $block 1t

  execute as 910fb361-682f-4f5d-a98c-717fcc4c9bcc at @s run {
    clone ~-4 ~-4 ~-4 ~4 ~4 ~4 ~-4 ~-6 ~-4 masked move
    tp @s ~ ~-2 ~
    execute unless block ~ ~-7 ~ minecraft:air run function nadi:disasters/meteoroid/stop
  }
}
