# Description: Performs all kinds of things for players who are under the free sky
# AS: every player under the sky, AT: @s
# Called from function: 2mal3:nadi/natural_disasters/sandstorm/ticks/second
# Datapack by 2mal3

tellraw @a[scores={nadi.debug_mode=4..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"aqua"},{"text":"/","color":"gray"},{"text":"DEBUG","color":"aqua"},{"text": "/","color": "gray"},{"selector":"@s", "color": "aqua"},{"text":"]: ","color":"gray"},{"text":"Sandstorm effect","color":"aqua"}]

# Creates a configured number of anchor entities
scoreboard players operation .temp_0 nadi.data = $sandstorm.anchor_entities nadi.config
function 2mal3:nadi/utilities/summon_anchors

# Spreads the anchors entitys and creates sand above them at maximum building height
spreadplayers ~ ~ 2 20 false @e[type=minecraft:area_effect_cloud,tag=nadi.anchor,distance=..0.1]

# Saves that the wind sound is played to the player
tag @s add nadi.sound
 
 # Gives the players bad potion effects
effect give @s minecraft:blindness 5 0 true
effect give @s minecraft:slowness 5 1 true
