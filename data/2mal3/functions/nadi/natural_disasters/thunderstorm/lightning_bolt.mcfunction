# Description: Creates a fixed number of anchor entities and spreads them out
# AS: every normal player in the overwold, AT: @s
# Called from function: 2mal3:nadi/natural_disasters/thunderstorm/ticks/5_seconds
# Datapack by 2mal3

# Creates a configured number of anchor entities
scoreboard players operation .temp_0 nadi.data = $thunderstorm.anchor_entities nadi.config
function 2mal3:nadi/utilities/summon_anchors
# Distributes the anchor entitys
spreadplayers ~ ~ 10 40 false @e[type=minecraft:area_effect_cloud,tag=nadi.anchor,distance=..0.1]
