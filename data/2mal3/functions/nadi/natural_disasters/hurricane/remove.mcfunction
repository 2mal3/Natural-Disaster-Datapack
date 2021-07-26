# Description: Stops the hurricane and resets it to the beginning
# AS: serverr, AT: server
# Called from function: 2mal3:nadi/natural_disasters/hurricane/ticks/minute
# Datapack by 2mal3

tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text": "/","color": "gray"},{"text":"Server", "color": "green"},{"text":"]: ","color":"gray"},{"text":"The hurricane has stopped","color":"green"}]


# Sends a message to all players when enabled
execute if score $notifications nadi.config matches 1 run tellraw @a {"text":"The hurricane stops.","color":"gray"}

# Stops the loops from the hurricane
schedule clear 2mal3:nadi/natural_disasters/hurricane/ticks/tick
schedule clear 2mal3:nadi/natural_disasters/hurricane/ticks/second
schedule clear 2mal3:nadi/natural_disasters/hurricane/ticks/minute

# Stops the sound library loop
schedule clear 2mal3:nadi/utilities/sound/loop

# Saves that no natural disaster is off
scoreboard players set %natural_disaster_on nadi.data 0
# Saves that the bed can be used
scoreboard players set %prevent_sleep nadi.data 0

# Remove all fallig blocks
execute as @e[type=minecraft:cow,tag=nadi.hurricane] at @s run kill @e[type=minecraft:falling_block,distance=..100]
# Remove the hurricane anchor
tp @e[type=minecraft:cow,tag=nadi.hurricane] ~ -1000 ~
# Resets the weather
weather clear

# Sets a new time until the next natural disaster begins
function 2mal3:nadi/new_time
