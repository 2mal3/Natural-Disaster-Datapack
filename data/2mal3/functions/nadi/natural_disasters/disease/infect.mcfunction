# Description: inefcts a entity
# Called from: 2mal3:nadi/natural_disasters/disease/tick
# Datapck by 2mal3

tag @s add nadi.infected
data merge entity @s[type=!minecraft:player] {DeathLootTable:"2mal3:nadi/disease/infected"}
