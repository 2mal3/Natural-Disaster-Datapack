# Description: Starts a acid rain
# Called from function: 2mal3:nadi/choose_disaster
# Datapck by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"A acid rain is started.","color":"green"}]


# Sends a message to all players when enabled
execute if score $nadi.notifications_on nadi.config matches 1 run tellraw @a {"text":"A acid rain begins.","color":"gray"}

# Loads the time for the acid rain from the config
scoreboard players operation $nadi.time nadi.data = $nadi.acid_rain_time nadi.config
# Saves that a natural disaster is active
scoreboard players set $nadi.natural_disaster_on nadi.data 1
# Saves that the bed can not be used
scoreboard players set $nadi.prevent_sleep nadi.data 1

# Sets the weather to endless rain
weather rain 99999

# Starts the loops
schedule function 2mal3:nadi/natural_disasters/acid_rain/ticks/minute 60s
schedule function 2mal3:nadi/natural_disasters/acid_rain/ticks/second 1s
schedule function 2mal3:nadi/natural_disasters/acid_rain/ticks/tick 1t


# Calls the corresponding function of the api
function #nadi_api:acid_rain_time
