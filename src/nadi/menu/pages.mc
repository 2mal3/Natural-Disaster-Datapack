## Displays the different pages of the GUI

# Displays the main menu
function main {
  function nadi:menu/utilities/click
  tellraw @s {"text": "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}

  tellraw @s [{"text": "       Natural Disaster Datapack ", "bold": true, "color": "gold", "hoverEvent": {"action": "show_text", "contents": "§7by 2mal3"}}, {"text": "<%config.version.str%>", "color": "red", "bold": false}]
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

  # Reinstall datapack
  tellraw @s [{"text": "♻", "color": "dark_red"}, {"text": " Reinstall datapack ➤", "color": "red", "clickEvent": {"action": "run_command", "value": "/function nadi:menu/buttons/reinstall"}, "hoverEvent": {"action": "show_text", "contents": "§7*click*"}}]
  # Uninstall the datapack
  tellraw @s [{"text": "⚠", "color": "dark_red"}, {"text": " Uninstall datapack ➤", "color": "red", "clickEvent": {"action": "run_command", "value": "/function nadi:menu/buttons/uninstall"}, "hoverEvent": {"action": "show_text", "contents": "§7*click*"}}]
  tellraw @s {"text": ""}
}

function start_disaster {
  function nadi:menu/utilities/click
  tellraw @s {"text": "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}

  tellraw @s [{"text": "🌧", "color": "yellow"}, {"text": " Acid Rain", "color": "gold", "clickEvent": {"action": "run_command", "value": "/function nadi:menu/buttons/start_disaster/acid_rain"}, "hoverEvent": {"action": "show_text", "contents": "§7*click*"}}]
  tellraw @s [{"text": "❄", "color": "yellow"}, {"text": " Blizzard", "color": "gold", "clickEvent": {"action": "run_command", "value": "/function nadi:menu/buttons/start_disaster/blizzard"}, "hoverEvent": {"action": "show_text", "contents": "§7*click*"}}]
  tellraw @s [{"text": "⏺", "color": "yellow"}, {"text": " Doline", "color": "gold", "clickEvent": {"action": "run_command", "value": "/function nadi:menu/buttons/start_disaster/doline"}, "hoverEvent": {"action": "show_text", "contents": "§7*click*"}}]
  tellraw @s [{"text": "⬛", "color": "yellow"}, {"text": " Hail", "color": "gold", "clickEvent": {"action": "run_command", "value": "/function nadi:menu/buttons/start_disaster/hail"}, "hoverEvent": {"action": "show_text", "contents": "§7*click*"}}]
  tellraw @s [{"text": "☄", "color": "yellow"}, {"text": " Meteoroid", "color": "gold", "clickEvent": {"action": "run_command", "value": "/function nadi:menu/buttons/start_disaster/meteoroid"}, "hoverEvent": {"action": "show_text", "contents": "§7*click*"}}]
  tellraw @s [{"text": "⚡", "color": "yellow"}, {"text": " Thunderstorm", "color": "gold", "clickEvent": {"action": "run_command", "value": "/function nadi:menu/buttons/start_disaster/thunderstorm"}, "hoverEvent": {"action": "show_text", "contents": "§7*click*"}}]
  tellraw @s [{"text": "≈", "color": "yellow"}, {"text": " Hurricane", "color": "gold", "clickEvent": {"action": "run_command", "value": "/function nadi:menu/buttons/start_disaster/hurricane"}, "hoverEvent": {"action": "show_text", "contents": "§7*click*"}}]

  tellraw @s {"text": ""}
  tellraw @s {"text": "← Back", "color": "red", "clickEvent": {"action": "run_command", "value": "/function nadi:menu/pages/main"}, "hoverEvent": {"action": "show_text", "contents": "§7*click*"}}
}
