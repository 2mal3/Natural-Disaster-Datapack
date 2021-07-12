# Description: Summons anchor entities in a range of 40 blocks around every normal player
# AT: every normal player in the overworld, AT: @s
# Called from functions: 2mal3:nadi/natural_disasters/acid_rain/ticks/second
# Datapack by 2mal3

tellraw @a[scores={nadi.debug_mode=4..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"aqua"},{"text":"/","color":"gray"},{"text":"DEBUG","color":"aqua"},{"text": "/","color": "gray"},{"selector":"@s", "color": "aqua"},{"text":"]: ","color":"gray"},{"text":"Acid rain effect","color":"aqua"}]

# Creates a configured number of anchor entities
scoreboard players operation .temp_0 nadi.data = $acid_rain.anchor_entities nadi.config
function 2mal3:nadi/utilities/summon_anchors
# Spreads the anchor entitys
spreadplayers ~ ~ 10 40 false @e[type=minecraft:area_effect_cloud,tag=nadi.anchor,distance=..0.1]
