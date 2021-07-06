# Description: Starts a hail
# AS: server, AT: server
# Called from function: 2mal3:nadi/choose_disaster
# Datapack by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"A hail is started.","color":"green"}]


# Sends a message to all players when enabled
execute if score $notifications nadi.config matches 1 run tellraw @a {"text":"A hail begins.","color":"gray"}

# Loads the time for the acid rain from the config
scoreboard players operation .time nadi.data = $hail.time nadi.config
# Saves that a natural disaster is active
scoreboard players set .natural_disaster_on nadi.data 1
# Saves that the bed can not be used
scoreboard players set .prevent_sleep nadi.data 1

# Sets the weather to endless rain
weather rain 99999

# Starts the loops
schedule function 2mal3:nadi/natural_disasters/hail/ticks/second 61s replace
schedule function 2mal3:nadi/natural_disasters/hail/ticks/minute 120s replace


# Calls a function from the api to modify the natural disaster
function #nadi_api:hail_time
