# Description: Starts a drought
# Called from function: 2mal3:nadi/choose_disaster
# Datapck by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"A drought is started.","color":"green"}]


# Sends a message to all players when enabled
execute if score $nadi.notifications nadi.config matches 1 run tellraw @a {"text":"A drought begins.","color":"gray"}

# Loads the time for the acid rain from the config
scoreboard players operation $nadi.time nadi.data = $nadi.drought.time nadi.config
# Saves that a natural disaster is active
scoreboard players set $nadi.natural_disaster_on nadi.data 1

# Starts the loops
schedule function 2mal3:nadi/natural_disasters/drought/ticks/tick 1t
schedule function 2mal3:nadi/natural_disasters/drought/ticks/second 1s
schedule function 2mal3:nadi/natural_disasters/drought/ticks/minute 60s

# Sets the radom tick speed for the time of drought to 1
gamerule randomTickSpeed 1
# Deletes all maker entities
kill @e[type=minecraft:area_effect_cloud,tag=nadi.drought_converted]


# Calls the corresponding function of the api
function #nadi_api:drought_time