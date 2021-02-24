# Description: The doline loop 5 ticks
# Called from functions: 2mal3:nadi/natural_disasters/doline/create, 2mal3:nadi/natural_disasters/doline/tick
# Datapack by 2mal3

# Moves the bottom of the doline down one block
execute as @e[type=minecraft:area_effect_cloud,tag=nadi.doline] at @s run function 2mal3:nadi/natural_disasters/doline/doline


# Calls this function again in 5 ticks
schedule function 2mal3:nadi/natural_disasters/doline/tick 5t

# Count down the time and then stop the acid rain
scoreboard players remove $nadi.time nadi.data 1
execute if score $nadi.time nadi.data matches 0 run function 2mal3:nadi/natural_disasters/doline/remove
