# Description: Gives the block that is thrown away by the hurricane a random direction of movement
# AS: falling block in the center of the hurricane, AT: @s
# Called from function: 2mal3:nadi/natural_disasters/hurricane/catch
# Datapack by 2mal3

# Gennerates a random x speed from -1.50 to 1.50 and stores it in the falling block
scoreboard players set .in_0 2mal3.random -150
scoreboard players set .in_1 2mal3.random 150
function 2mal3:random/random
execute store result entity @s Motion[0] double 0.01 run scoreboard players get .out_0 2mal3.random

# Gennerates a random y speed from -0.50 to 1.50 and stores it in the falling block
scoreboard players set .in_0 2mal3.random -50
scoreboard players set .in_1 2mal3.random 150
function 2mal3:random/random
execute store result entity @s Motion[1] double 0.01 run scoreboard players get .out_0 2mal3.random

# Gennerates a random z speed from -1.50 to 1.50 and stores it in the falling block
scoreboard players set .in_0 2mal3.random -150
scoreboard players set .in_1 2mal3.random 150
function 2mal3:random/random
execute store result entity @s Motion[2] double 0.01 run scoreboard players get .out_0 2mal3.random


# Turns on gravity for the falling block and prevents a bug that the falling  block disapper
data merge entity @s {NoGravity: 0b, Time: 1, HurtEntities: 1b, FallHurtMax: 40, FallHurtAmount: 0.05f}


# Saves that the block is no longer affected by the hurricane
tag @s add nadi.hurricane.ignore
