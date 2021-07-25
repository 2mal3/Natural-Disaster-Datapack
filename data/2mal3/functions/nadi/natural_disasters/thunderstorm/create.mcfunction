# Description: Starts a thunderstorm
# AS: server, AT: server
# Called from function: 2mal3:nadi/choose_disaster
# Datapck by 2mal3

tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text": "/","color": "gray"},{"text":"Server", "color": "green"},{"text":"]: ","color":"gray"},{"text":"A thunderstorm is started","color":"green"}]

# Sends a message to all players when enabled
execute if score $notifications nadi.config matches 1 run tellraw @a {"text":"A thunderstorm begins.","color":"gray"}

# Loads the time for the thunderstorm from the config
scoreboard players operation .time nadi.data = $thunderstorm.time nadi.config
# Saves that a natural disaster is active
scoreboard players set .natural_disaster_on nadi.data 1
# Saves that the bed can not be used
scoreboard players set .prevent_sleep nadi.data 1

# Starts the loops
schedule function 2mal3:nadi/natural_disasters/thunderstorm/ticks/second 65s replace
schedule function 2mal3:nadi/natural_disasters/thunderstorm/ticks/minute 120s replace

# Sets the weather to endless thunderstorm
weather thunder 999999

# Calls a function from the api to modify the natural disaster
function #2mal3:nadi/api/natural_disasters/thunderstorm
