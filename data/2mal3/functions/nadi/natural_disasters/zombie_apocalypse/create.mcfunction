# Description: Starts a zombie apocalypse
# AS: server, AT: server
# Called from function: 2mal3:nadi/choose_disaster
# Datapack by 2mal3

tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text": "/","color": "gray"},{"text":"Server", "color": "green"},{"text":"]: ","color":"gray"},{"text":"A zombie apocalypse has started","color":"green"}]

# Sends a message to all players when enabled
execute if score $notifications nadi.config matches 1 run tellraw @a {"text":"A zombie apocalypse begins.","color":"gray"}

# Loads the time for the zombie_apocalypse from the config
scoreboard players operation %time nadi.data = $zombie_apocalypse.time nadi.config
# Saves that a natural disaster is active
scoreboard players set %natural_disaster_on nadi.data 1

# Starts the loops
schedule function 2mal3:nadi/natural_disasters/zombie_apocalypse/ticks/minute 120s replace
schedule function 2mal3:nadi/natural_disasters/zombie_apocalypse/ticks/second 61s replace

# Saves the current difficulty and then set the difficulty to hard
execute store result score .difficulty nadi.data run difficulty
difficulty hard

# Calls a function from the api to modify the natural disaster
function #2mal3:nadi/api/natural_disasters/zombie_apocalypse
