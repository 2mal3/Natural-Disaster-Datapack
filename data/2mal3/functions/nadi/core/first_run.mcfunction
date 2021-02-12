# Description: One-time commands at the first start of the datapack
# Called from function: 2mal3:nadi/core/reload
# Datapack by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"Datapack installed!","color":"green"}]


# init disaster scoreboards
function 2mal3:nadi/new_time
scoreboard players set $nadi.firestorm_on nadi.data 0
scoreboard players set $nadi.first nadi.data 1
scoreboard players set $nadi.natural_disaster_on nadi.data 0

# load  start config
function 2mal3:nadi/core/start_config


# Remembers that the Datapack was installed
scoreboard players set $nadi.first_run nadi.data 1

# Sends installation message
tellraw @a [{"text":"Natural Disaster Datapack v1.1.1 by 2mal3 was installed!","color":"blue"}]
