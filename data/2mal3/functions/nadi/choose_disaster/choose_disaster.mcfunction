# Description: Chooses a random desaster and executes the start function of it
# AS: server, AT: server
# Called from function: 2mal3:nadi/core/loops/minute
# Datapack by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"Randomly select a natural disaster ...","color":"green"}] 


# Selects a random number between zero and the number of natural disasters
scoreboard players set .in_0 2mal3.random 1

scoreboard players operation .in_1 2mal3.random = $natural_disasters nadi.data
scoreboard players remove .in_1 2mal3.random 1
function 2mal3:random/random

# Selects a natural disaster based on the generated number
data modify storage 2mal3:nadi temp set from storage 2mal3:nadi natural_disasters
function 2mal3:nadi/choose_disaster/loop

# Executes the start function of the selected natural disaster 
data modify block 1000 64 1002 Command set from storage 2mal3:nadi temp[0]
# Resets the command block in the next tick
schedule function 2mal3:nadi/choose_disaster/clear 2t
