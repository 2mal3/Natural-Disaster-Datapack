# Description: Stops the meteoroid and resets it to the beginning
# AS: server, AT: server
# Called from function: 2mal3:nadi/natural_disasters/meteoroid/tick
# Datapck by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={nadi.debug_mode=4..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"aqua"},{"text":"/","color":"gray"},{"text":"DEBUG","color":"aqua"},{"text":"]: ","color":"gray"},{"text":"The meteoroid has stopped.","color":"aqua"}]

# Stops the loops from the meteoroid
schedule clear 2mal3:nadi/natural_disasters/meteoroid/tick
# Saves that no natural disaster is off
scoreboard players set %natural_disaster_on nadi.data 0

# Moves the meteorite one last time into the ground
execute as @e[type=minecraft:marker,tag=nadi.meteoroid] at @s run clone ~-4 ~-4 ~-4 ~4 ~4 ~4 ~-4 ~-9 ~-4 masked move
# Deletes the anchor entity
kill @e[type=minecraft:marker,tag=nadi.meteoroid]

# Sets a new time until the next natural disaster begins
function 2mal3:nadi/new_time
