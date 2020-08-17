# Description: inefcts a entity
# Called from: nadi:natural_disasters/disease/tick
# Datapck by 2mal3

tag @s add nadi.infected
data merge entity @s[type=!minecraft:player] {DeathLootTable:"nadi:disease/infected"}
