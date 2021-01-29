# Description: Removes the disease
# Called from: 2mal3:nadi/natural_disasters/disease/tick
# Datapck by 2mal3

# message
execute if score $nadi.notifications_on nadi.config matches 1 run tellraw @a {"translate":"The disease stops.","color":"gray"}

# remove ingame scoreboards
scoreboard players reset $nadi.infected nadi.data
scoreboard players reset @e nadi.infected_t
tag @e remove nadi.not_infectable

# clear items
clear @a minecraft:ghast_tear{display:{Name:'{"text":"Part of a remedy","color":"blue"}'}}
clear @a minecraft:firework_star{display:{Name:'{"text":"Remedy","color":"blue"}'}}

# new time for a natural diasater
function 2mal3:nadi/new_time

schedule clear 2mal3:nadi/natural_disasters/disease/tick
scoreboard players set $nadi.natural_disaster_on nadi.data 0
