# Description: Determines the time until the next natural disaster after a natural disaster
# Called from functions: 2mal3:nadi/natural_disasters/...:remove
# Datapack by 2mal3

# Generates a random time
scoreboard players operation $2mal3.random.in_0 2mal3.random = $nadi.time.min nadi.config
scoreboard players operation $2mal3.random.in_1 2mal3.random = $nadi.time.max nadi.config
function 2mal3:random/random
scoreboard players operation $nadi.time nadi.data = $2mal3.random.out_0 2mal3.random

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"Generate random time from ","color":"green"},{"score":{"name":"$2mal3.random.in_0","objective":"2mal3.random"},"color":"gray"},{"text":" to ","color":"green"},{"score":{"name":"$2mal3.random.in_1","objective":"2mal3.random"},"color":"gray"},{"text":" minutes until next natural disaster ...","color":"green"}]

# Calls an api functions
function #nadi_api:new_time

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"The next natural disaster will begin in ","color":"green"},{"score":{"name":"$nadi.time","objective":"nadi.data"},"color":"gray"},{"text":" minutes.","color":"green"}] 
