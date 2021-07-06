# Description: Chooses a random desaster and executes the start function of it
# AS: server, AT: server
# Called from function: 2mal3:nadi/core/loops/minute
# Datapack by 2mal3

tellraw @a[scores={nadi.debug_mode=4..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"aqua"},{"text":"/","color":"gray"},{"text":"DEBUG","color":"aqua"},{"text": "/","color": "gray"},{"text":"Server", "color": "aqua"},{"text":"]: ","color":"gray"},{"text":"Randomly select a natural disaster ...","color":"aqua"}]


# Selects a random number between 0 and the number of natural disasters
scoreboard players set .in_0 2mal3.random 1

scoreboard players operation .in_1 2mal3.random = $natural_disasters nadi.data
scoreboard players remove .in_1 2mal3.random 1
function 2mal3:random/random

# Selects a natural disaster based on the generated number
data modify storage 2mal3:nadi temp set from storage 2mal3:nadi natural_disasters
function 2mal3:nadi/choose_disaster/loop

# Executes the start function of the selected natural disaster 
data modify block 7162814 1 5656277 Command set from storage 2mal3:nadi temp[0]
# Resets the command block in the next tick
schedule function 2mal3:nadi/choose_disaster/clear 2t
