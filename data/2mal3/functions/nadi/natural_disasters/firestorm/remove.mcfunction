# Description: Stops the firestorm and resets it to the beginning
# Called from function: 2mal3:nadi/natural_disasters/firestorm/ticks/minute
# Datapack by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"The firestorm has stopped.","color":"green"}]


# Sends a message to all players when enabled
execute if score $notifications nadi.config matches 1 run tellraw @a {"text":"The firestorm stops.","color":"gray"}

# Stops the loops from the firestorm
schedule clear 2mal3:nadi/natural_disasters/firestorm/ticks/minute
schedule clear 2mal3:nadi/natural_disasters/firestorm/ticks/second
schedule clear 2mal3:nadi/natural_disasters/firestorm/ticks/tick

# Saves that no natural disaster is off
scoreboard players set .natural_disaster_on nadi.data 0

# remove firetails
tp @e[tag=nadi.firestorm.s,type=minecraft:slime] ~ -1000 ~

# Sets a new time until the next natural disaster begins
function 2mal3:nadi/new_time
