# Description: Open the main menu for datapack options
# Called from: #nadi:menu
# Datapack by 2mal3

tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text": ""}


tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text":"Natural Datapck Menu","color":"gold","bold":true}

tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text":"Datapack config","color":"yellow","clickEvent":{"action":"run_command","value":"/function #nadi:config"},"hoverEvent":{"action":"show_text","value":"*click*"}}
tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text":"Manual start a natural disaster","color":"yellow","clickEvent":{"action":"run_command","value":"/function #nadi:start_disaster"},"hoverEvent":{"action":"show_text","value":"*click*"}}
tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text":"Debug the Natural Disaster Datapack","color":"yellow","clickEvent":{"action":"run_command","value":"/function #nadi:debug"},"hoverEvent":{"action":"show_text","value":"*click*"}}
tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text":"Uninstall the Natural Disaster Datapack","color":"red","clickEvent":{"action":"run_command","value":"/function #nadi:uninstall"},"hoverEvent":{"action":"show_text","value":"*click*"}}


tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text": ""}
