# Description: Stops the doline and resets it to the beginning
# AS: server, AT: server
# Called from function: 2mal:nadi/natural_disasters/doline/tick
# Datapack by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text": "/","color": "gray"},{"text":"Server", "color": "green"},{"text":"]: ","color":"gray"},{"text":"The doline has stopped.","color":"green"}]


# Stops the loop from the doline
schedule clear 2mal3:nadi/natural_disasters/doline/tick

# Saves that no natural disaster is off
scoreboard players set .natural_disaster_on nadi.data 0

# Deletes the anchor
kill @e[type=minecraft:marker,tag=nadi.doline]

# Sets a new time until the next natural disaster begins
function 2mal3:nadi/new_time
