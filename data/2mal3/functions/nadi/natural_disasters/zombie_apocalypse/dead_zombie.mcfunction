# Description: Places a deat body at the death point of every zombie
# AS: death point maker item, AT: @s
# Called from function: 2mal3:nadi/natural_disasters/zombie_apocalypse/ticks/second
# Datapack by 2mal3

# Remove the marker item
kill @s
# Place dead body
setblock ~ ~ ~ minecraft:nether_wart_block
