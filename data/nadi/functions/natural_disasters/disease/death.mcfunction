# Description: if a infectet player dies
# Called from: nadi:natural_disasters/disease/tick
# Datapck by 2mal3

tag @s remove nadi.infected
tag @s remove nadi.not_infectable
scoreboard players reset @s nadi.infected_t
scoreboard players reset @s nadi.deathCount
