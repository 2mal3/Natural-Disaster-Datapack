# Description: Starts a blizzard
# Called from: function 2mal3:nadi/choose_disaster
# Datapack by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"A blizzard is started.","color":"green"}]


# Sends a message to all players when enabled
execute if score $nadi.notifications nadi.config matches 1 run tellraw @a {"text":"A blizzard begins.","color":"gray"}

# Loads the time for the acid rain from the config
scoreboard players operation $nadi.time nadi.data = $nadi.blizzard.time nadi.config
# Saves that a natural disaster and the blizzard are active
scoreboard players set $nadi.natural_disaster_on nadi.data 1

# Starts the blizzard loop in 4 seconds
schedule function 2mal3:nadi/natural_disasters/blizzard/ticks/minute 60s
schedule function 2mal3:nadi/natural_disasters/blizzard/ticks/second 1s
schedule function 2mal3:nadi/natural_disasters/blizzard/ticks/tick 1t

# Starts the sound library loop
function 2mal3:nadi/libraries/sound/loop


# Calls the corresponding function of the api
function #nadi_api:blizzard_time