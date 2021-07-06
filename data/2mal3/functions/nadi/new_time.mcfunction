# Description: Determines the time until the next natural disaster after a natural disaster
# AS: server, AT: server
# Called from functions: 2mal3:nadi/natural_disasters/...:remove
# Datapack by 2mal3

# Generates a random time
scoreboard players operation .in_0 2mal3.random = $time.min nadi.config
scoreboard players operation .in_1 2mal3.random = $time.max nadi.config
function 2mal3:random/random
scoreboard players operation .time nadi.data = .out_0 2mal3.random

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"Generate random time from ","color":"green"},{"score":{"name":".in_0","objective":"2mal3.random"},"color":"gray"},{"text":" to ","color":"green"},{"score":{"name":".in_1","objective":"2mal3.random"},"color":"gray"},{"text":" minutes until next natural disaster ...","color":"green"}]

# Calls the api function to modify the time unt
function #nadi_api:new_time

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"The next natural disaster will begin in ","color":"green"},{"score":{"name":".time","objective":"nadi.data"},"color":"gray"},{"text":" minutes.","color":"green"}]
