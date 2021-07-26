# Description: Stops the drought and resets it to the beginning
# AS: server, AT: server
# Called from function: 2mal3:nadi/natural_disasters/drought/ticks/minute
# Datapack by 2mal3

tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text": "/","color": "gray"},{"text":"Server", "color": "green"},{"text":"]: ","color":"gray"},{"text":"The drought has stopped","color":"green"}]


# Sends a message to all players when enabled
execute if score $notifications nadi.config matches 1 run tellraw @a {"text":"The drought stops.","color":"gray"}

# Stops the loops
schedule clear 2mal3:nadi/natural_disasters/drought/ticks/tick
schedule clear 2mal3:nadi/natural_disasters/drought/ticks/second
schedule clear 2mal3:nadi/natural_disasters/drought/ticks/minute

# Saves that no natural disaster is off
scoreboard players set %natural_disaster_on nadi.data 0

# Resets the radom tick speed back to 3
gamerule randomTickSpeed 3
# Deletes all maker entities
kill @e[type=minecraft:area_effect_cloud,tag=nadi.drought_converted]

# Sets a new time until the next natural disaster begins
function 2mal3:nadi/new_time
