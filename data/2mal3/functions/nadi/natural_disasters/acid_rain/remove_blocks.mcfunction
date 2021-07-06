# Description: Removes 10 random blocks on the surface in a radius of 40 blocks around the player
# AT: every player in the overworld, AT: @s
# Called from functions: 2mal3:nadi/natural_disasters/acid_rain/ticks/second
# Datapack by 2mal3

tellraw @a[scores={nadi.debug_mode=4..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"aqua"},{"text":"/","color":"gray"},{"text":"DEBUG","color":"aqua"},{"text": "/","color": "gray"},{"selector":"@s", "color": "aqua"},{"text":"]: ","color":"gray"},{"text":"Acid rain effect","color":"aqua"}]

# Creates a configured number of anchor entities
scoreboard players operation .temp_0 nadi.data = $acid_rain.anchor_entities nadi.config
function 2mal3:nadi/utilities/summon_anchors

# Spreads the anchor entitys and remove the block under them
spreadplayers ~ ~ 10 40 false @e[type=minecraft:area_effect_cloud,tag=nadi.anchor,distance=..0.1]
execute as @e[type=minecraft:area_effect_cloud,tag=nadi.anchor] at @s unless block ~ ~-1 ~ #2mal3:nadi/acid_rain/acid_rain_immune run setblock ~ ~-1 ~ minecraft:air
