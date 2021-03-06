# Description: Gives each new fireball a slight random sideways movement speed
# AS: every new fireball, AT: server
# Called from function: 2mal3:nadi/natural_disasters/firestorm/ticks/second
# Datapack by 2mal3

# Sets the variables for the random number generator
scoreboard players set .in_0 2mal3.random -5
scoreboard players set .in_1 2mal3.random 5

# Gennerates a random x speed from -0.05 to 0.05 and stores it in the fireball
function 2mal3:random/random
execute store result entity @s power[0] double 0.01 run scoreboard players get .out_0 2mal3.random
# Gennerates a random y speed from -0.05 to 0.05 and stores it in the fireball
function 2mal3:random/random
execute store result entity @s power[2] double 0.01 run scoreboard players get .out_0 2mal3.random

# Saves that the entity was processed
tag @s add nadi.init
