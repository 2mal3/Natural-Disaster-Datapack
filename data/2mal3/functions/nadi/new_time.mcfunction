# Description: Determines the time until the next natural disaster after a natural disaster
# Called from: 2mal3:nadi/natural_disasters/...:remove
# Datapack by 2mal3

# Generates a random time
scoreboard players set $2mal3.random.in_0 2mal3.random 4200
scoreboard players set $2mal3.random.in_1 2mal3.random 16800
function 2mal3:random/random
scoreboard players operation $nadi.time nadi.data = $2mal3.random.out_0 2mal3.random

# Calls an api functions
function #nadi_api:new_time
