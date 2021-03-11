# Description: Break blocks and convert them to falling blocks
# Called from function: 2mal3:nadi/natural_disasters/hurricane/ticks/tick
# Datapack by 2mal3

# Creates 2 anchor entities
scoreboard players set $nadi.temp_0 nadi.data 2
function 2mal3:nadi/libraries/summon_anchors

# Distributes the anchor entities in a certain radius
spreadplayers ~ ~ 5 20 false @e[type=minecraft:area_effect_cloud,tag=nadi.anchor]

# A block is converted into a falling block
execute as @e[type=minecraft:area_effect_cloud,tag=nadi.anchor] at @s positioned ~ ~-1 ~ run function 2mal3:nadi/natural_disasters/hurricane/convert_block
# An explosion is triggered
execute if predicate 2mal3:nadi/hurricane/random_tnt as @e[type=minecraft:area_effect_cloud,tag=nadi.anchor] at @s run summon minecraft:tnt ~ ~ ~
