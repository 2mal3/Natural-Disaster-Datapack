# Description: The doline loop 5 ticks
# AS: server, AT: server
# Called from functions: 2mal3:nadi/natural_disasters/doline/create, 2mal3:nadi/natural_disasters/doline/tick
# Datapack by 2mal3

# Calls this function again in 5 ticks
schedule function 2mal3:nadi/natural_disasters/doline/tick 5t replace

# Moves the bottom of the doline down one block
execute as @e[type=minecraft:area_effect_cloud,tag=nadi.doline] at @s run function 2mal3:nadi/natural_disasters/doline/doline

# Count down the time and then stop the acid rain
scoreboard players remove .time nadi.data 1
execute if score .time nadi.data matches 0 run function 2mal3:nadi/natural_disasters/doline/remove
