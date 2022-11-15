## Actions of buttons in the gui

function reinstall {
  function nadi:menu/click
  tellraw @s {"text": "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}

  tellraw @s [{"text": "Do you really want to reinstall the Natural Disaster Datapack?\n", "color": "red"}, {"text": "[ No ]", "color": "dark_green", "clickEvent": {"action": "run_command", "value": "/function nadi:menu/pages/main"}, "hoverEvent":{"action": "show_text", "contents": "§7*click*"}}, {"text": "  [ Yes ]","color":"dark_red", "clickEvent": {"action": "run_command", "value": "/function nadi:core/reinstall"}, "hoverEvent": {"action": "show_text", "contents": "§7*click*"}}]
  tellraw @s {"text":""}
}

function stop_disaster {
  function nadi:menu/click

  execute if score %disasterActive nadi.data matches 0 run {
    title @s actionbar {"text": "No natural diasters active"}
  }
  execute if score %disasterActive nadi.data matches 1 run {
    title @s actionbar {"text": "Stopped natural diaster"}
    function #nadi:api/v1/stop
  }
}

dir start_disaster {
  function acid_rain {
    function nadi:menu/click

    title @s actionbar {"text": "Starting an acid rain"}
    function nadi:menu/pages/main
    function nadi:disasters/acid_rain/api/start
  }

  function blizzard {
    function nadi:menu/click

    title @s actionbar {"text": "Starting an blizzard"}
    function nadi:menu/pages/main
    function nadi:disasters/blizzard/api/start
  }

  function doline {
    function nadi:menu/click

    title @s actionbar {"text": "Starting an doline"}
    function nadi:menu/pages/main
    function nadi:disasters/doline/api/start
  }

  function hail {
    function nadi:menu/click

    title @s actionbar {"text": "Starting an hail"}
    function nadi:menu/pages/main
    function nadi:disasters/hail/api/start
  }

  function meteoroid {
    function nadi:menu/click

    title @s actionbar {"text": "Starting an meteoroid"}
    function nadi:menu/pages/main
    function nadi:disasters/meteoroid/api/start
  }

  function thunderstorm {
    function nadi:menu/click

    title @s actionbar {"text": "Starting an thunderstorm"}
    function nadi:menu/pages/main
    function nadi:disasters/thunderstorm/api/start
  }

  function hurricane {
    function nadi:menu/click

    title @s actionbar {"text": "Starting an hurricane"}
    function nadi:menu/pages/main
    function nadi:disasters/hurricane/api/start
  }
}

function start_disaster {
  function nadi:menu/click

  execute if score %disasterActive nadi.data matches 0 run {
    function nadi:menu/pages/start_disaster
  }
  execute if score %disasterActive nadi.data matches 1 run title @s actionbar {"text": "You can't start a second natural disaster when another one is in progress"}
}

function start_random_disaster {
  function nadi:menu/click

  execute if score %disasterActive nadi.data matches 0 run {
    title @s actionbar {"text": "Started random natural disaster"}
    function nadi:core/select
  }
  execute if score %disasterActive nadi.data matches 1 run title @s actionbar {"text": "You can't start a second natural disaster when another one is in progress"}

}

function uninstall {
  function nadi:menu/utilities/click
  tellraw @s {"text": "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}

  tellraw @s [{"text": "Do you really want to uninstall the Natural Disaster Datapack?\n", "color": "red"}, {"text": "[ No ]", "color": "dark_green", "clickEvent": {"action": "run_command", "value": "/function nadi:menu/pages/main"}, "hoverEvent":{"action": "show_text", "contents": "§7*click*"}}, {"text": "  [ Yes ]","color":"dark_red", "clickEvent": {"action": "run_command", "value": "/function nadi:core/uninstall"}, "hoverEvent": {"action": "show_text", "contents": "§7*click*"}}]
  tellraw @s {"text":""}
}
