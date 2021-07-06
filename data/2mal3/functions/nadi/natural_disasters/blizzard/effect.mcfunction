# Description: Performs all kinds of things for players who are under the free sky
# AS: @a[tag=!global.ignore,predicate=2mal3:nadi/in_overworld,gamemode=!spectator,predicate=2mal3:nadi/check_sky]
# Called from function: 2mal3:nadi/natural_disasters/blizzard/ticks/second
# Datapack by 2mal3

tellraw @a[scores={nadi.debug_mode=4..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"aqua"},{"text":"/","color":"gray"},{"text":"DEBUG","color":"aqua"},{"text": "/","color": "gray"},{"selector":"@s", "color": "aqua"},{"text":"]: ","color":"gray"},{"text":"Blizzard effect","color":"aqua"}]

# Creates a configured number of anchor entities
scoreboard players operation .temp_0 nadi.data = $blizzard.anchor_entities nadi.config
function 2mal3:nadi/utilities/summon_anchors
# Spreads the anchor entities
spreadplayers ~ ~ 2 10 false @e[type=minecraft:area_effect_cloud,tag=nadi.anchor,distance=..0.1]

# Saves that the wind sound is played to the player
tag @s add nadi.sound
 
 # Gives the players bad potion effects
effect give @s minecraft:blindness 5 0 true
effect give @s minecraft:slowness 5 1 true
