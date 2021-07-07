# Description: Determines the time until the next natural disaster after a natural disaster
# AS: server, AT: server
# Called from functions: 2mal3:nadi/natural_disasters/...:remove
# Datapack by 2mal3

# Generates a random time
scoreboard players operation .in_0 2mal3.random = $time.min nadi.config
scoreboard players operation .in_1 2mal3.random = $time.max nadi.config
function 2mal3:random/random
scoreboard players operation .time nadi.data = .out_0 2mal3.random

tellraw @a[scores={nadi.debug_mode=4..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"aqua"},{"text":"/","color":"gray"},{"text":"INFO","color":"aqua"},{"text": "/","color": "gray"},{"text": "Server","color": "auqa"},{"text":"]: ","color":"gray"},{"text":"Generate random time from ","color":"aqua"},{"score":{"name":".in_0","objective":"2mal3.random"},"color":"gray"},{"text":" to ","color":"aqua"},{"score":{"name":".in_1","objective":"2mal3.random"},"color":"gray"},{"text":" minutes until next natural disaster ...","color":"aqua"}]
tellraw @a[scores={nadi.debug_mode=4..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"aqua"},{"text":"/","color":"gray"},{"text":"INFO","color":"aqua"},{"text": "/","color": "gray"},{"text": "Server","color": "auqa"},{"text":"]: ","color":"gray"},{"text":"The next natural disaster will begin in ","color":"aqua"},{"score":{"name":".time","objective":"nadi.data"},"color":"gray"},{"text":" minutes","color":"aqua"}]

# Calls the api function to modify the time unt
function #2mal3:nadi/api/new_time
