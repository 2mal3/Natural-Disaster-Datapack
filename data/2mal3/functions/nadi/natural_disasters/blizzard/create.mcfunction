# Description: Starts a blizzard
# Called from: function 2mal3:nadi/choose_disaster
# Datapack by 2mal3

tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text": "/","color": "gray"},{"text":"Server", "color": "green"},{"text":"]: ","color":"gray"},{"text":"A blizzard is started","color":"green"}]


# Sends a message to all players when enabled
execute if score $notifications nadi.config matches 1 run tellraw @a {"text":"A blizzard begins.","color":"gray"}

# Loads the time for the acid rain from the config
scoreboard players operation %time nadi.data = $blizzard.time nadi.config
# Saves that a natural disaster and the blizzard are active
scoreboard players set %natural_disaster_on nadi.data 1

# Starts the blizzard loops
schedule function 2mal3:nadi/natural_disasters/blizzard/ticks/minute 120s replace
schedule function 2mal3:nadi/natural_disasters/blizzard/ticks/second 61s replace
schedule function 2mal3:nadi/natural_disasters/blizzard/ticks/tick 1201t replace

# Starts the sound library loop
function 2mal3:nadi/utilities/sound/loop


# Calls a function from the api to modify the natural disaster
function #2mal3:nadi/api/natural_disasters/blizzard
