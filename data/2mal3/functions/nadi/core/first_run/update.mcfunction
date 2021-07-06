# Description: Adds new things at the first start of a new datapack version
# AS: server, AT: server
# Called from function: 2mal3:nadi/core/reload
# Datapack by 2mal3

# Output debug message in chat, if enabled
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"Updated datapack!","color":"green"}]

# Creates an active command block in the world
forceload add 7162814 5656277
setblock 7162814 1 5656277 minecraft:repeating_command_block{auto: 1b}

# Set version variable in format xx.xx.xx
scoreboard players set $version nola.data 020000
