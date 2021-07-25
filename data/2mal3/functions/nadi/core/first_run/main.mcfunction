# Description: Installs the Datapack on first start
# AS: server, AT: server
# Called from function: 2mal3:nadi/core/reload
# Datapack by 2mal3

tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text": "/","color": "gray"},{"text":"Server", "color": "green"},{"text":"]: ","color":"gray"},{"text":"Datapack installed","color":"green"}]

# Adds scoreboards
scoreboard objectives add nadi.data dummy
scoreboard objectives add nadi.debug_mode dummy
scoreboard objectives add nadi.config dummy
# Adds teams
team add nadi.zombies
# Set gamerules
gamerule commandBlockOutput false

# Install libraries
function 2mal3:random/reload
# Load start config
function 2mal3:nadi/core/first_run/start_config

# Set the version in format: xx.xx.xx
scoreboard players set $version nadi.data 020000
# Init disaster scoreboards
scoreboard players set .natural_disaster_on nadi.data 0
function 2mal3:nadi/new_time

# Creates an active command block somewhere in the world
forceload add 7162814 5656277
setblock 7162814 1 5656277 minecraft:repeating_command_block{auto: 1b}

# Sends Insatlations message after 4 sekonds
schedule function 2mal3:nadi/core/first_run/send_message 4s

# Remembers that the Datapack was installed
scoreboard players set .first_run nadi.data 1
