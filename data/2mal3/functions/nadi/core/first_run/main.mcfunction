# Description: Installs the Datapack on first start
# Called from function: 2mal3:nadi/core/reload
# Datapack by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"Datapack installed!","color":"green"}]


# Adds scoreboards
scoreboard objectives add nadi.data dummy
scoreboard objectives add nadi.debug_mode dummy
scoreboard objectives add nadi.config dummy

# Set the version in format: xx.xx.xx
scoreboard players set $nadi.version nadi.data 020000

# Install libraries
function 2mal3:random/reload

# Load start config
function 2mal3:nadi/core/first_run/start_config

# Init disaster scoreboards
scoreboard players set $nadi.natural_disaster_on nadi.data 0
function 2mal3:nadi/new_time

# Sends Insatlations message after 4 sekonds
schedule function 2mal3:nadi/core/first_run/send_message 4s


# Remembers that the Datapack was installed
scoreboard players set $nadi.first_run nadi.data 1
