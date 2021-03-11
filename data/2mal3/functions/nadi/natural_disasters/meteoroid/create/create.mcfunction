# Description: Starts a meteoroid
# Called from function: 2mal3:nadi/choose_disaster
# Datapck by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"A meteoroid is started.","color":"green"}]


# Sends a message to all players when enabled
execute if score $nadi.notifications_on nadi.config matches 1 run tellraw @a {"text":"A meteoroid begins.","color":"gray"}

# Saves that a natural disaster is active
scoreboard players set $nadi.natural_disaster_on nadi.data 1

# Creates the meteorite over a random player in the overworld who is not a spectator
execute as @r[gamemode=!spectator,tag=!global.ignore,predicate=2mal3:nadi/in_overworld] at @s run function 2mal3:nadi/natural_disasters/meteoroid/create/place_meteoroid

# Starts the loops
schedule function 2mal3:nadi/natural_disasters/meteoroid/tick 2s
