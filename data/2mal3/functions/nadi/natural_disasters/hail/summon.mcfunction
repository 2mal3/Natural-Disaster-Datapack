# Description: Creates hail at each player that falls down
# AS: every player in the overworld, AT: @s
# Called from function: 2mal3:nadi/natural_disasters/acid_rain/ticks/second
# Datapack by 2mal3

tellraw @a[scores={nadi.debug_mode=4..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"aqua"},{"text":"/","color":"gray"},{"text":"DEBUG","color":"aqua"},{"text": "/","color": "gray"},{"selector":"@s", "color": "aqua"},{"text":"]: ","color":"gray"},{"text":"Hail effect","color":"aqua"}]

# Creates a configured number of anchor entities
scoreboard players operation .temp_0 nadi.data = $hail.anchor_entities nadi.config
function 2mal3:nadi/utilities/summon_anchors

# Spreads the anchor entitys and creates hail at the maximum building height above them
spreadplayers ~ ~ 8 30 false @e[type=minecraft:area_effect_cloud,tag=nadi.anchor,distance=..0.1]
execute as @e[type=minecraft:area_effect_cloud,tag=nadi.anchor] at @s run summon falling_block ~ 255 ~ {BlockState: {Name: "minecraft:ice"}, Time: 1, HurtEntities: 1b, FallHurtMax: 40, FallHurtAmount: 0.03f}
