# Description: Uninstalls the Datapack
# Called from function: core/uninstall/uninstall_ask
# Datapack by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"Datapack uninstalled!","color":"green"}]

# Stop all natural disasters
function #2mal3:nadi/stop_natural_disasters

# Uninstalls the libraries
function 2mal3:random/uninstall

# Stops the loops
schedule clear 2mal3:nadi/core/loops/minute

# Deletes the scoreboards
scoreboard objectives remove nadi.data
scoreboard objectives remove nadi.debug_mode
scoreboard objectives remove nadi.config

# Remove volcanoes makers
kill @e[type=minecraft:armor_stand,tag=nadi.volcano]

# Sends an uninstallation message to all players
tellraw @a [{"text":"Natural Disaster Datapack v2.0.0 by 2mal3 was successfully uninstalled."}]

# Disables the datapack
datapack disable "file/Natural-Disaster-Datapack-v2.0.0"
datapack disable "file/Natural-Disaster-Datapack-v2.0.0.zip"
