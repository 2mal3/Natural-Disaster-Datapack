# Description: Removes the disease
# Called from: ndd.disease:tick
# Datapck by 2mal3

# message
execute if score ndd.notifications_on ndd.config matches 1 run tellraw @a {"translate":"The disease stops.","color":"gray"}

# remove ingame scoreboards
scoreboard players reset ndd.infected ndd.data
scoreboard players reset @e ndd.infected_t
tag @e remove ndd.not_infectable

# clear items
clear @a minecraft:ghast_tear{display:{Name:'{"text":"Part of a remedy","color":"blue"}'}}
clear @a minecraft:firework_star{display:{Name:'{"text":"Remedy","color":"blue"}'}}

# new time for a natural diasater
function ndd:new_time

schedule clear ndd.disease:tick
scoreboard players set ndd.natural_disaster_on ndd.data 0
