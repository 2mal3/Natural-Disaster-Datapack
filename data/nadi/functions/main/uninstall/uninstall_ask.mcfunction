# Description: uninstall
# Called from: #uninstall
# Datapack by 2mal3

tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] ["",{"text":"Do you really want to deinstall the ","color":"red"},{"text":"Natural Disaster Datapack","color":"red"},{"text":" v","color":"red"},{"score":{"name":"$V1","objective":"nadi.data"},"color":"red"},{"text":".","color":"red"},{"score":{"name":"$V2","objective":"nadi.data"},"color":"red"},{"text":".","color":"red"},{"score":{"name":"$V3","objective":"nadi.data"},"color":"red"},{"text":" by 2mal3?","color":"red"},{"text":"\n"},{"text":"[No]","color":"dark_green","hoverEvent":{"action":"show_text","value":"*click*"}},{"text":" \u0020"},{"text":"[Yes]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function nadi:main/uninstall/uninstall"},"hoverEvent":{"action":"show_text","value":"*click*"}}]
