# Description: The hurricane loop every tick
# Called from functions: 2mal3:nadi/natural_disasters/hurricane/create, 2mal3:nadi/natural_disasters/hurricane/ticks/tick
# Datapck by 2mal3

# Displays the hurricane with particles above the anchor cow
execute as @e[type=minecraft:cow,tag=nadi.hurricane] at @s run function 2mal3:nadi/natural_disasters/hurricane/particle

# Pulls all entities near the center of the hurricane
execute as @e[type=minecraft:cow,tag=nadi.hurricane] at @s run function 2mal3:nadi/natural_disasters/hurricane/catch

# Destroys with a certain probability blocks in the perimeter of the hurricane
execute if predicate 2mal3:nadi/hurricane/random_break_block as @e[type=minecraft:cow,tag=nadi.hurricane] at @s run function 2mal3:nadi/natural_disasters/hurricane/break


# Calls this function again in one tick
schedule function 2mal3:nadi/natural_disasters/hurricane/ticks/tick 1t replace