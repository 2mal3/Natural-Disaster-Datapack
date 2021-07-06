# Description: The drought loop every second
# AS: server, AT: server
# Called from function: 2mal3:nadi/natural_disasters/drought/create, 2mal3:nadi/natural_disasters/drought/ticks/second
# Datapack by 2mal3

# Calls this function again in one second
schedule function 2mal3:nadi/natural_disasters/drought/ticks/second 1s replace

# Creates anchor entitys at the corners of the surrounding chunks
execute as @a[gamemode=!spectator,tag=!global.ignore,predicate=2mal3:nadi/in_overworld] at @s positioned ~ 32 ~ unless entity @e[type=minecraft:area_effect_cloud,tag=nadi.anchor,distance=..16] run function 2mal3:nadi/natural_disasters/drought/convert_blocks/summon/player
# "Dries out" the chunk with a anchor entity
execute as @e[type=minecraft:area_effect_cloud,tag=nadi.anchor] at @s unless entity @e[type=minecraft:area_effect_cloud,tag=nadi.drought_converted,distance=..1] run function 2mal3:nadi/natural_disasters/drought/convert_blocks/convert
