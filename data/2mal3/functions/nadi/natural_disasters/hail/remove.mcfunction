# Description: Removes the hail
# Called from: 2mal3:nadi/natural_disasters/hail/tick
# Datapack by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"The hail has stopped.","color":"green"}]


# Sends a message to all players when enabled
execute if score $notifications nadi.config matches 1 run tellraw @a {"text":"The hail stops.","color":"gray"}

# Stops the loops from the hail
schedule clear 2mal3:nadi/natural_disasters/hail/ticks/minute
schedule clear 2mal3:nadi/natural_disasters/hail/ticks/second

# Saves that no natural disaster is off
scoreboard players set .natural_disaster_on nadi.data 0
# Saves that the bed can be used
scoreboard players set .prevent_sleep nadi.data 0

# Makes the weather back to normal
weather clear

# Sets a new time until the next natural disaster begins
function 2mal3:nadi/new_time
