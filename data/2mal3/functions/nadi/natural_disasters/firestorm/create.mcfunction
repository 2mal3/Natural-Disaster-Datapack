# Description: Starts a firestorm
# Called from function: 2mal3:nadi/choose_disaster
# Datapack by 2mal3

tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text": "/","color": "gray"},{"text":"Server", "color": "green"},{"text":"]: ","color":"gray"},{"text":"A firestorm is started","color":"green"}]


# Sends a message to all players when enabled
execute if score $notifications nadi.config matches 1 run tellraw @a {"text":"A firestorm begins.","color":"gray"}

# Loads the time for the firestorm from the config
scoreboard players operation .time nadi.data = $firestorm.time nadi.config
# Saves that a natural disaster is active
scoreboard players set .natural_disaster_on nadi.data 1

# Starts the loops
schedule function 2mal3:nadi/natural_disasters/firestorm/ticks/minute 120s replace
schedule function 2mal3:nadi/natural_disasters/firestorm/ticks/second 61s replace
schedule function 2mal3:nadi/natural_disasters/firestorm/ticks/tick 1201t replace

# Calls a function from the api to modify the natural disaster
function #2mal3:nadi/api/natural_disasters/firestorm
