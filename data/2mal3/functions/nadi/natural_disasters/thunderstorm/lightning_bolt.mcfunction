# Description: Creates a fixed number of anchor entities and spreads them out
# Called from function: 2mal3:nadi/natural_disasters/thunderstorm/ticks/5_seconds
# Datapck by 2mal3

# Creates 1 anchor entity
scoreboard players set $nadi.temp_0 nadi.data 1
function 2mal3:nadi/libraries/summon_anchors

# Distributes the anchor entitys
spreadplayers ~ ~ 10 40 false @e[type=minecraft:area_effect_cloud,tag=nadi.anchor,distance=..0.1]