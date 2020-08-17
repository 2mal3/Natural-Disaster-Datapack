# Description: Open menu for manual start natural disasters
# Called from: #nadi:menu
# Datapack by 2mal3

tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text":"Natural Datapck Menu","color":"gold","bold":true}

tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text":"Acid Rain","color":"yellow","clickEvent":{"action":"run_command","value":"/function nadi:natural_disasters/acid_rain/create"},"hoverEvent":{"action":"show_text","value":"*click*"}}
tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text":"Blizzard","color":"yellow","clickEvent":{"action":"run_command","value":"/function nadi:natural_disasters/blizzard/create"},"hoverEvent":{"action":"show_text","value":"*click*"}}
tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text":"Disease","color":"yellow","clickEvent":{"action":"run_command","value":"/function nadi:natural_disasters/disease/create"},"hoverEvent":{"action":"show_text","value":"*click*"}}
tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text":"Doline","color":"yellow","clickEvent":{"action":"run_command","value":"/function nadi:natural_disasters/doline/create"},"hoverEvent":{"action":"show_text","value":"*click*"}}
tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text":"Drought","color":"yellow","clickEvent":{"action":"run_command","value":"/function nadi:natural_disasters/drought/create"},"hoverEvent":{"action":"show_text","value":"*click*"}}
tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text":"Firestorm","color":"yellow","clickEvent":{"action":"run_command","value":"/function nadi:natural_disasters/firestorm/create"},"hoverEvent":{"action":"show_text","value":"*click*"}}
tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text":"Hail","color":"yellow","clickEvent":{"action":"run_command","value":"/function nadi:natural_disasters/hail/create"},"hoverEvent":{"action":"show_text","value":"*click*"}}
tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text":"Hurricane","color":"yellow","clickEvent":{"action":"run_command","value":"/function nadi:natural_disasters/hurricane/create"},"hoverEvent":{"action":"show_text","value":"*click*"}}
tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text":"Meteoroid","color":"yellow","clickEvent":{"action":"run_command","value":"/function nadi:natural_disasters/meteoroid/create.1"},"hoverEvent":{"action":"show_text","value":"*click*"}}
tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text":"Sandstorm","color":"yellow","clickEvent":{"action":"run_command","value":"/function nadi:natural_disasters/sandstorm/create"},"hoverEvent":{"action":"show_text","value":"*click*"}}
tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text":"Thunderstorm","color":"yellow","clickEvent":{"action":"run_command","value":"/function nadi:natural_disasters/thunderstorm/create"},"hoverEvent":{"action":"show_text","value":"*click*"}}
tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text":"Volcano","color":"yellow","clickEvent":{"action":"run_command","value":"/function nadi:natural_disasters/volcano/eruption/1"},"hoverEvent":{"action":"show_text","value":"*click*"}}