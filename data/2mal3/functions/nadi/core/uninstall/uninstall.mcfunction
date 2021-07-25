# Description: Uninstalls the Datapack
# AS: player, AT: player
# Called from function: core/uninstall/uninstall_ask
# Datapack by 2mal3

tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text": "/","color": "gray"},{"text":"Server", "color": "green"},{"text":"]: ","color":"gray"},{"text":"Datapack uninstalled","color":"green"}]

# Stop all natural disasters
function #2mal3:nadi/stop_natural_disasters
# Uninstalls the libraries
function 2mal3:random/uninstall
# Stops the loop
schedule clear 2mal3:nadi/core/loop

# Deletes the scoreboards
scoreboard objectives remove nadi.data
scoreboard objectives remove nadi.debug_mode
scoreboard objectives remove nadi.config
# Remove teams
team remove nadi.zombies
# Deletes the storage
data merge storage 2mal3:nadi {}

# Removes the active command block
forceload remove 7162814 5656277
setblock 7162814 1 5656277 minecraft:stone
# Remove volcanoes makers
kill @e[type=minecraft:marker,tag=nadi.volcano]
# Reset gamerules
gamerule commandBlockOutput true

# Call api function to uninstall installed extensions and plugins
function #2mal3:nadi/api/uninstall

# Sends an uninstallation message to all players
tellraw @a [{"text":"Natural Disaster Datapack v2.0.0 by 2mal3 was successfully uninstalled."}]

# Disables the datapack
datapack disable "file/Natural-Disaster-Datapack-v2.0.0"
datapack disable "file/Natural-Disaster-Datapack-v2.0.0.zip"
