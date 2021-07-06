# Description: Creates the firestorm entitys at a random position 20 blocks around a player in the air
# AS: every player in the overworld, AT: @s
# Called from function: 2mal3:nadi/natural_disasters/firestorm/ticks/second
# Datapack by 2mal3

tellraw @a[scores={nadi.debug_mode=4..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"aqua"},{"text":"/","color":"gray"},{"text":"DEBUG","color":"aqua"},{"text": "/","color": "gray"},{"selector":"@s", "color": "aqua"},{"text":"]: ","color":"gray"},{"text":"Firestorm effect","color":"aqua"}]

# Creates a configured number of anchor entities
scoreboard players operation .temp_0 nadi.data = $firestorm.anchor_entities nadi.config
function 2mal3:nadi/utilities/summon_anchors

# Spreads the anchor entitys in 20 block radius
spreadplayers ~ ~ 10 20 false @e[type=minecraft:area_effect_cloud,tag=nadi.anchor,distance=..0.1]
# Creates over the anchor entitys the fire that falls to the ground
execute as @e[type=minecraft:area_effect_cloud,tag=nadi.anchor] at @s run summon small_fireball ~ 255 ~ {power: [0.0d, -0.07d, 0.0d], Tags: ["global.ignore", "nadi.fire"], Item: {id: "minecraft:stone_button", Count: 1b}}
