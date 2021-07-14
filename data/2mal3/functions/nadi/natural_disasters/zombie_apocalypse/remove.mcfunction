# Description: Stops the zombie apocalypse and resets it to the beginning
# AS: server, AT: server
# Called from function: 2mal3:nadi/natural_disasters/acid_rain/ticks/minute
# Datapack by 2mal3

tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text": "/","color": "gray"},{"text":"Server", "color": "green"},{"text":"]: ","color":"gray"},{"text":"The zombie apocalypse has stopped","color":"green"}]

# Sends a message to all players when enabled
execute if score $notifications nadi.config matches 1 run tellraw @a {"text":"The zombie apocalypse stops.","color":"gray"}

# Stops the loops from the acid rain
schedule clear 2mal3:nadi/natural_disasters/zombie_apocalypse/ticks/minute
schedule clear 2mal3:nadi/natural_disasters/zombie_apocalypse/ticks/second

# Saves that no natural disaster is off
scoreboard players set .natural_disaster_on nadi.data 0

# Resets the difficulty
execute if score .difficulty nadi.data matches 0 run difficulty peaceful
execute if score .difficulty nadi.data matches 1 run difficulty easy
execute if score .difficulty nadi.data matches 2 run difficulty normal
execute if score .difficulty nadi.data matches 3 run difficulty hard
# Remove all tags from zombies
tag @e[tag=nadi.processed] remove nadi.processed
tag @e[tag=nadi.block] remove nadi.block

# Sets a new time until the next natural disaster begins
function 2mal3:nadi/new_time
