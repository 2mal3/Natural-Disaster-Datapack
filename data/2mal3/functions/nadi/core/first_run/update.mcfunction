# Description: Adds new things at the first start of a new datapack version
# Called from function: 2mal3:nadi/core/reload
# Datapack by 2mal3

# Output debug message in chat, if enabled
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"Updated datapack!","color":"green"}]


# Set version variable in format xx.xx.xx
scoreboard players set $nadi.version nola.data 010101