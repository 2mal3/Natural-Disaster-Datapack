# Description: Stops the blizzard and resets it to the beginning
# Called from function: 2mal3:nadi/natural_disasters/acid_rain/tick
# Datapack by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"The blizzard has stopped.","color":"green"}]


# Sends a message to all players when enabled
execute if score nadi.notifications_on nadi.config matches 1 run tellraw @a {"translate":"The blizzard stops.","color":"gray"}

# Stops the loops from the blizzard
schedule clear 2mal3:nadi/natural_disasters/blizzard/ticks/minute
schedule clear 2mal3:nadi/natural_disasters/blizzard/ticks/second
schedule clear 2mal3:nadi/natural_disasters/blizzard/ticks/tick

# Stops the sound library loop
schedule clear 2mal3:nadi/libraries/sound/loop

# Saves that natural disaster and blizzard are off
scoreboard players set $nadi.natural_disaster_on nadi.data 0

# Deletes all marker entitys
kill @e[type=minecraft:armor_stand,tag=nadi.blizzard]
# Resets the sound module for each player
scoreboard players reset @a[scores={nadi.sound=1..}] nadi.sound

# Sets a new time until the next natural disaster begins
function 2mal3:nadi/new_time
