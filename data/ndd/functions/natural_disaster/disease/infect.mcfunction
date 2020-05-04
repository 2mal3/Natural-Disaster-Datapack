# Description: inefcts a entity
# Called from: ndd:natural_disaster/disease/tick
# Datapck by 2mal3

tag @s add ndd.infected
data merge entity @s[type=!minecraft:player] {DeathLootTable:"ndd:infected"}

execute if entity @s[gamemode=spectator] run tag @s remove ndd.infected
execute if entity @s[gamemode=creative] run tag @s remove ndd.infected
