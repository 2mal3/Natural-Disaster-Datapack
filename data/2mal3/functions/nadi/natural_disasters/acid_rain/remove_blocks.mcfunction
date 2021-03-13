# Description: Removes 10 random blocks on the surface in a radius of 40 blocks around the player
# Called from functions: 2mal3:nadi/natural_disasters/acid_rain/ticks/tick
# Datapck by 2mal3

# Creates a configured number of anchor entities
scoreboard players operation $nadi.temp_0 nadi.data = $nadi.acid_rain.anchor_entities nadi.config
function 2mal3:nadi/libraries/summon_anchors

# Spreads the anchor entitys and remove the block under them
spreadplayers ~ ~ 10 40 false @e[type=minecraft:area_effect_cloud,tag=nadi.anchor,distance=..0.1]
execute as @e[type=minecraft:area_effect_cloud,tag=nadi.anchor] at @s unless block ~ ~-1 ~ #2mal3:nadi/acid_rain/acid_rain_immune run setblock ~ ~-1 ~ minecraft:air