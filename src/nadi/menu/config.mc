import ../../../macros/option_range.mcm
import ../../../macros/option_bool.mcm
import ../../../macros/option.mcm


function page {
  execute if score %page nadi.data matches 1 run function nadi:menu/config/page_1
}

function page_1 {
  function nadi:menu/utilities/click
  scoreboard players set %page nadi.data 1

  tellraw @s {"text": "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
  tellraw @s ["",{"text":"     Natural Disaster Config","bold":true,"color":"gold"},{"text":"\n"},{"text":"<<","color":"gold"},{"text":" ","color":"yellow"},{"text":"                ","strikethrough":true,"color":"yellow"},{"text":" "},{"score":{"name":"%page","objective":"nadi.data"},"color":"gold"},{"text":"/1 ","color":"gold"},{"text":"                ","strikethrough":true,"color":"yellow"},{"text":" >>","color":"gold"}]
  tellraw @s {"text": ""}

  # Generell
  option_range $maxTime nadi.data 20 <Max Time> <Maximum time until a new natural disaster. (minutes)\n§7Default: 600> nadi:menu/buttons/config/generell/max_time
  option_range $minTime nadi.data 20 <Min Time> <Minimum time until a new natural disaster. (minutes)\n§7Default: 140> nadi:menu/buttons/config/generell/min_time

  # Acid Rain
  tellraw @s {"text": ""}
  option acidRain acid_rain <Acid Rain> 15 10
  # Blizzard
  tellraw @s {"text": ""}
  option blizzard blizzard Blizzard 20 10


  tellraw @s {"text": ""}
  tellraw @s {"text": "← Back", "color": "red", "clickEvent": {"action": "run_command", "value": "/function nadi:menu/pages/main"}, "hoverEvent": {"action": "show_text", "contents": "§7*click*"}}
}
