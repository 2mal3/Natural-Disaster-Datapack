# Description: Open the core menu for datapack options
# Called from: #2mal3:nadi/menu
# Datapack by 2mal3

tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text": ""}


tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text":"Natural Datapck Menu","color":"gold","bold":true}

tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text":"Datapack config","color":"yellow","clickEvent":{"action":"run_command","value":"/function #2mal3:nadi/config"},"hoverEvent":{"action":"show_text","value":"*click*"}}
tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text":"Manual start a natural disaster","color":"yellow","clickEvent":{"action":"run_command","value":"/function #2mal3:nadi/start_disaster"},"hoverEvent":{"action":"show_text","value":"*click*"}}
tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text":"Debug the Natural Disaster Datapack","color":"yellow","clickEvent":{"action":"run_command","value":"/function #2mal3:nadi/debug"},"hoverEvent":{"action":"show_text","value":"*click*"}}
tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text":"Uninstall the Natural Disaster Datapack","color":"red","clickEvent":{"action":"run_command","value":"/function #2mal3:nadi/uninstall"},"hoverEvent":{"action":"show_text","value":"*click*"}}


tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text": ""}
