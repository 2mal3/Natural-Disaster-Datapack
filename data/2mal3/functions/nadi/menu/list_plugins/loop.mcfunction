# Description: Shows all installed plugins
# AS: player, AT: player
# Called from functions: 2mal3:nadi/menu/list_plugins, 2mal3:nadi/menu/loop
# Datapack by 2mal3

#tellraw @s [{"nbt":"temp[0].name","storage":"2mal3:nadi","interpret":true,"color":"red"},{"text":" by ","color":"gold"},{"nbt":"temp[0].author","storage":"2mal3:nadi","interpret":true,"color":"red"}]
tellraw @s [{"nbt":"temp[0].name","storage":"2mal3:nadi","color":"gold"},{"text":" by ","color":"gold"},{"nbt":"temp[0].author","storage":"2mal3:nadi","color":"gold"}]
data remove storage 2mal3:nadi temp[0]
execute if data storage 2mal3:nadi temp[0] run function 2mal3:nadi/menu/list_plugins/loop
