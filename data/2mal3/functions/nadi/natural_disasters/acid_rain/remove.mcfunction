# Description: Stops the acid rain and resets it to the beginning
# Called from function: 2mal3:nadi/natural_disasters/acid_rain/ticks/minute
# Datapack by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"The acid rain has stopped.","color":"green"}]

# Sends a message to all players when enabled
execute if score $nadi.notifications nadi.config matches 1 run tellraw @a {"text":"The acid rain stops.","color":"gray"}

# Stops the loops from the acid rain
schedule clear 2mal3:nadi/natural_disasters/acid_rain/ticks/minute
schedule clear 2mal3:nadi/natural_disasters/acid_rain/ticks/second
schedule clear 2mal3:nadi/natural_disasters/acid_rain/ticks/tick

# Saves that no natural disaster is off
scoreboard players set $nadi.natural_disaster_on nadi.data 0
# Saves that the bed can be used
scoreboard players set $nadi.prevent_sleep nadi.data 0

# Makes the weather back to normal
weather clear

# Sets a new time until the next natural disaster begins
function 2mal3:nadi/new_time