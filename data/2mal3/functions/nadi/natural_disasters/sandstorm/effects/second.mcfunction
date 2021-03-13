# Description: Performs all kinds of things for players who are under the free sky
# Called from function: 2mal3:nadi/natural_disasters/sandstorm/ticks/second
# Datapack by 2mal3

# Creates a configured number of anchor entities
scoreboard players operation $nadi.temp_0 nadi.data = $nadi.sandstorm.anchor_entities nadi.config
function 2mal3:nadi/libraries/summon_anchors

# Spreads the anchors entitys and creates sand above them at maximum building height
spreadplayers ~ ~ 2 10 false @e[type=minecraft:area_effect_cloud,tag=nadi.anchor,distance=..0.1]
execute as @e[type=minecraft:area_effect_cloud,tag=nadi.anchor] at @s run summon falling_block ~ 255 ~ {BlockState: {Name: "minecraft:sand"}, Time: 1}

# Saves that the wind sound is played to the player
tag @s add nadi.sound
 
 # Gives the players bad potion effects
effect give @s minecraft:blindness 5 0 true
effect give @s minecraft:slowness 5 1 true
