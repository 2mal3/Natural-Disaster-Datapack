# Description: Creates hail at each player that falls down
# Called from function: 2mal3:nadi/natural_disasters/acid_rain/ticks/second
# Datapack by 2mal3

# Creates 5 anchor entities
scoreboard players set $nadi.temp_0 nadi.data 5
function 2mal3:nadi/libraries/summon_anchors

# Spreads the anchor entitys and creates hail at the maximum building height above them
spreadplayers ~ ~ 8 30 false @e[type=minecraft:area_effect_cloud,tag=nadi.anchor,distance=..0.1]
execute as @e[type=minecraft:area_effect_cloud,tag=nadi.anchor] at @s run summon falling_block ~ 255 ~ {BlockState: {Name: "minecraft:ice"}, Time: 1, HurtEntities: 1b, FallHurtMax: 40, FallHurtAmount: 0.03f}
