# Description: Stops the sandstorm and resets it to the beginning
# AS: server, AT: server
# Called from function: 2mal3:nadi/natural_disasters/acid_rain/tick
# Datapack by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"The sandstorm has stopped.","color":"green"}]


# Sends a message to all players when enabled
execute if score nadi.notifications nadi.config matches 1 run tellraw @a {"text":"The sandstorm stops.","color":"gray"}

# Stops the loops from the sandstorm
schedule clear 2mal3:nadi/natural_disasters/sandstorm/ticks/minute
schedule clear 2mal3:nadi/natural_disasters/sandstorm/ticks/second
schedule clear 2mal3:nadi/natural_disasters/sandstorm/ticks/tick

# Stops the sound library loop
schedule clear 2mal3:nadi/utilities/sound/loop

# Saves that natural disaster and sandstorm are off
scoreboard players set .natural_disaster_on nadi.data 0

# Sets a new time until the next natural disaster begins
function 2mal3:nadi/new_time
