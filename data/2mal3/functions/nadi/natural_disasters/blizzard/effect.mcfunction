# Description: Performs all kinds of things for players who are under the free sky
# Called from function: 2mal3:nadi/natural_disasters/blizzard/ticks/second
# Datapack by 2mal3

# Creates 5 anchor entitys and distributes them around the player
scoreboard players set $nadi.temp_0 nadi.data 5
function 2mal3:nadi/libraries/summon_anchors
spreadplayers ~ ~ 2 10 false @e[type=minecraft:area_effect_cloud,tag=nadi.anchor,distance=..0.1]

# Saves that the wind sound is played to the player
tag @s add nadi.sound
 
 # Gives the players bad potion effects
effect give @s minecraft:blindness 5 0 true
effect give @s minecraft:slowness 5 1 true
