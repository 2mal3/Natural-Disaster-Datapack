# Description: Starts a sandstorm
# Called from: function 2mal3:nadi/choose_disaster
# Datapack by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"A sandstorm is started.","color":"green"}]


# Sends a message to all players when enabled
execute if score $notifications nadi.config matches 1 run tellraw @a {"text":"A sandstorm begins.","color":"gray"}

# Loads the time for the acid rain from the config
scoreboard players operation .time nadi.data = $sandstorm.time nadi.config
# Saves that a natural disaster and the sandstorm are active
scoreboard players set .natural_disaster_on nadi.data 1

# Starts the sandstorm loop in 4 seconds
schedule function 2mal3:nadi/natural_disasters/sandstorm/ticks/minute 120s
schedule function 2mal3:nadi/natural_disasters/sandstorm/ticks/second 61s
schedule function 2mal3:nadi/natural_disasters/sandstorm/ticks/tick 1201t

# Starts the sound library loop
function 2mal3:nadi/utilities/sound/loop


# Calls the corresponding function of the api
function #nadi_api:sandstorm_time
