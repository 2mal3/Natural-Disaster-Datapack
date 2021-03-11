# Description: The main meteroid loop every tick
# Called from function: 2mal3:nadi/natural_disasters/meteoroid/tick, 2mal3:nadi/natural_disasters/meteoroid/create/create
# Datapack by 2mal3

# Calls the function again in the next tick
schedule function 2mal3:nadi/natural_disasters/meteoroid/tick 1t replace

# Moves the meteorite down one block
execute as @e[type=minecraft:area_effect_cloud,tag=nadi.meteoroid] at @s run function 2mal3:nadi/natural_disasters/meteoroid/move

# Tests whether the meteorite has hit the modes and ends the natural disaster if this is true
execute as @e[type=minecraft:area_effect_cloud,tag=nadi.meteoroid] at @s unless block ~ ~-6 ~ minecraft:air run function 2mal3:nadi/natural_disasters/meteoroid/remove