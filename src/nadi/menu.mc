
# Help function to make the UI cleaner
function click {
  playsound minecraft:ui.button.click master @s
  # Disables command feedback for a short time, so that no disturbing message is displayed
  gamerule sendCommandFeedback false
  schedule 1t replace {
    gamerule sendCommandFeedback true
  }
}


# Displays the different pages of the GUI
dir pages {
  # Displays the main menu
  function main {
    function nadi:menu/click
    tellraw @s {"text": "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}

    tellraw @s [{"text": "       Natural Disaster Datapack ", "bold": true, "color": "gold", "hoverEvent": {"action": "show_text", "contents": "§7by 2mal3"}}, {"text": "3", "color": "red", "bold": true}, {"text": ".", "color": "gold", "bold": true}, {"text": "0", "color": "red", "bold": true}, {"text": ".", "color": "gold", "bold": true}, {"text": "0", "color": "red", "bold": true}]
    tellraw @s {"text" : "                                                                ", "color": "yellow", "strikethrough": true, "clickEvent": {"action": "run_command", "value": "/function nadi:menu/pages/main"}}
    tellraw @s {"text": ""}

    # Info about the world
    tellraw @s [{"text": "⌚", "color": "yellow"}, {"text": " Next natural disaster in ", "color": "gold"}, {"score": {"name": "%time", "objective": "nadi.data"}, "color": "red"}, {"text": " minutes", "color": "gold"}]
    # execute if score %disasterTime nadi.data matches 1.. run tellraw @s [{"text": "⏳", "color": "yellow"}, {"text": " Natural disaster over in ", "color": "gold"}, {"score": {"name": "%disasterTime", "objective": "nadi.data"}, "color": "red"}, {"text": " minutes", "color": "gold"}]
    tellraw @s {"text": ""}

    # Actions
    tellraw @s [{"text": "🗡", "color": "yellow"}, {"text": " Start specific natural disaster ➤", "color": "gold", "clickEvent": {"action": "run_command", "value": "/function nadi:menu/buttons/start_disaster"}, "hoverEvent": {"action": "show_text", "contents": "§7*click*"}}]
    tellraw @s [{"text": "⚄", "color": "yellow"}, {"text": " Start a random natural disaster", "color": "gold", "clickEvent": {"action": "run_command", "value": "/function nadi:menu/buttons/start_random_disaster"}, "hoverEvent": {"action": "show_text", "contents": "§7*click*"}}]
    tellraw @s [{"text": "⏹", "color": "yellow"}, {"text": " Stop natural disaster", "color": "gold", "clickEvent": {"action": "run_command", "value": "/function nadi:menu/buttons/stop_disaster"}, "hoverEvent": {"action": "show_text", "contents": "§7*click*"}}]
    tellraw @s {"text": ""}

    # Links
    tellraw @s [{"text": "⏺", "color": "dark_aqua"}, {"text": " Planet Minecraft", "color": "aqua", "clickEvent": {"action": "open_url", "value": "https://www.planetminecraft.com/data-pack/natural-disaster-4574511/"}, "hoverEvent": {"action": "show_text", "contents": "§7click to open link"}}]
    tellraw @s [{"text": "🔥", "color": "dark_aqua"}, {"text": " Report a bug", "color": "aqua", "clickEvent": {"action": "open_url", "value": "https://github.com/2mal3/Natural-Disaster-Datapack/issues"}, "hoverEvent": {"action": "show_text", "contents": "§7click to open link"}}]
    # tellraw @s [{"text": "?", "color": "dark_aqua", "bold": true}, {"text": " Wiki", "color": "aqua", "bold": false, "clickEvent": {"action": "open_url", "value": "https://github.com/2mal3/Natural-Disaster-Datapack/wiki"}, "hoverEvent": {"action": "show_text", "contents": "§7click to open link"}}]
    tellraw @s {"text": ""}

    # Uninstall the datapack
    tellraw @s [{"text": "⚠", "color": "dark_red"}, {"text": " Uninstall the datapack ➤", "color": "red", "clickEvent": {"action": "run_command", "value": "/function nadi:menu/buttons/uninstall"}, "hoverEvent": {"action": "show_text", "contents": "§7*click*"}}]
    tellraw @s {"text": ""}
  }

  function start_disaster {
    function nadi:menu/click
    tellraw @s {"text": "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}

    tellraw @s [{"text": "☁", "color": "yellow"}, {"text": " Acid Rain", "color": "gold", "clickEvent": {"action": "run_command", "value": "/function nadi:menu/buttons/start_disaster/acid_rain"}, "hoverEvent": {"action": "show_text", "contents": "§7*click*"}}]
    tellraw @s [{"text": "❄", "color": "yellow"}, {"text": " Blizzard", "color": "gold", "clickEvent": {"action": "run_command", "value": "/function nadi:menu/buttons/start_disaster/blizzard"}, "hoverEvent": {"action": "show_text", "contents": "§7*click*"}}]
    tellraw @s [{"text": "⏺", "color": "yellow"}, {"text": " Doline", "color": "gold", "clickEvent": {"action": "run_command", "value": "/function nadi:menu/buttons/start_disaster/doline"}, "hoverEvent": {"action": "show_text", "contents": "§7*click*"}}]
    tellraw @s [{"text": "🌧", "color": "yellow"}, {"text": " Hail", "color": "gold", "clickEvent": {"action": "run_command", "value": "/function nadi:menu/buttons/start_disaster/hail"}, "hoverEvent": {"action": "show_text", "contents": "§7*click*"}}]
    tellraw @s [{"text": "☄", "color": "yellow"}, {"text": " Meteoroid", "color": "gold", "clickEvent": {"action": "run_command", "value": "/function nadi:menu/buttons/start_disaster/meteoroid"}, "hoverEvent": {"action": "show_text", "contents": "§7*click*"}}]
    tellraw @s [{"text": "⛈", "color": "yellow"}, {"text": " Thunderstorm", "color": "gold", "clickEvent": {"action": "run_command", "value": "/function nadi:menu/buttons/start_disaster/thunderstorm"}, "hoverEvent": {"action": "show_text", "contents": "§7*click*"}}]

    tellraw @s {"text": ""}
    tellraw @s {"text": "← Back", "color": "red", "clickEvent": {"action": "run_command", "value": "/function nadi:menu/pages/main"}, "hoverEvent": {"action": "show_text", "contents": "§7*click*"}}
  }
}


# Actions of buttons in the gui
dir buttons {
  function stop_disaster {
    function nadi:menu/click

    execute if score %disasterActive nadi.data matches 0 run {
      title @s actionbar {"text": "No natural diasters active"}
    }
    execute if score %disasterActive nadi.data matches 1 run {
      title @s actionbar {"text": "Stopped natural diaster"}
      function #nadi:api/stop
    }
  }

  dir start_disaster {
    function acid_rain {
      function nadi:menu/click

      title @s actionbar {"text": "Starting an acid rain"}
      function nadi:menu/pages/main
      function nadi:disasters/acid_rain/start
    }

    function blizzard {
      function nadi:menu/click

      title @s actionbar {"text": "Starting an blizzard"}
      function nadi:menu/pages/main
      function nadi:disasters/blizzard/start
    }

    function doline {
      function nadi:menu/click

      title @s actionbar {"text": "Starting an doline"}
      function nadi:menu/pages/main
      function nadi:disasters/doline/start
    }

    function hail {
      function nadi:menu/click

      title @s actionbar {"text": "Starting an hail"}
      function nadi:menu/pages/main
      function nadi:disasters/hail/start
    }

    function meteoroid {
      function nadi:menu/click

      title @s actionbar {"text": "Starting an meteoroid"}
      function nadi:menu/pages/main
      function nadi:disasters/meteoroid/start
    }

    function thunderstorm {
      function nadi:menu/click

      title @s actionbar {"text": "Starting an thunderstorm"}
      function nadi:menu/pages/main
      function nadi:disasters/thunderstorm/start
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
    function nadi:menu/click
    tellraw @s {"text": "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}

    tellraw @s [{"text": "Do you really want to uninstall the Natural Disaster Datapack?\n", "color": "red"}, {"text": "[ No ]", "color": "dark_green", "clickEvent": {"action": "run_command", "value": "/function nadi:menu/pages/main"}, "hoverEvent":{"action": "show_text", "contents": "§7*click*"}}, {"text": "  [ Yes ]","color":"dark_red", "clickEvent": {"action": "run_command", "value": "/function nadi:core/uninstall"}, "hoverEvent": {"action": "show_text", "contents": "§7*click*"}}]
    tellraw @s {"text":""}
  }
}
