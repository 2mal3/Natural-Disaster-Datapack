# Description: if a infectet player dies
# Called from: ndd:natural_disaster/disease/tick
# Datapck by 2mal3

tag @s remove ndd.infected
tag @s remove ndd.not_infectable
scoreboard players reset @s ndd.infected_t
scoreboard players reset @s ndd.deathCount
