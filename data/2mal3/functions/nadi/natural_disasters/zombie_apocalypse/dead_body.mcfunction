# Description: Places a deat body at the death point of every zombie
# AS: death point maker item, AT: @s
# Called from function: 2mal3:nadi/natural_disasters/zombie_apocalypse/dtick/second
# Datapack by 2mal3

tellraw @a[scores={nadi.debug_mode=4..}] [{"text":"[","color":"gray"},{"text":"NaturalDisasters","color":"aqua"},{"text":"/","color":"gray"},{"text":"DEBUG","color":"aqua"},{"text": "/","color": "gray"},{"selector":"@s", "color": "aqua"},{"text":"]: ","color":"gray"},{"text":"Dead body placed","color":"aqua"}]

# Remove the marker item
kill @s
# Place dead body
setblock ~ ~ ~ minecraft:nether_wart_block
