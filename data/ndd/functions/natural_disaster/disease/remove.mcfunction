# Description: Removes the disease
# Called from: ndd:natural_disaster/disease/tick
# Datapck by 2mal3

# remove ingame scoreboards
scoreboard players reset ndd.infected ndd.data
scoreboard players reset @e ndd.infected_t
tag @e remove ndd.not_infectable

# clear items
clear @a minecraft:ghast_tear{display:{Name:'{"text":"Part of a remedy","color":"blue"}'}}
clear @a minecraft:firework_star{display:{Name:'{"text":"Remedy","color":"blue"}'}}

# new time for a natural diasater
function ndd:new_time

schedule clear ndd:natural_disaster/disease/tick
scoreboard players set ndd.natural_disaster_on ndd.data 0
