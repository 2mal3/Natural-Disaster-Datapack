# Description: Chooses random positions in the near of a player to spawn extra zombies
# AS: every normal player in the overwolrd, AT: @s
# Called from functions: 2mal3:nadi/natural_disasters/zombie_apocalypse/ticks/minute
# Datapack by 2mal3

# Creates a configured number of anchor entities
scoreboard players set .temp_0 nadi.data 2
function 2mal3:nadi/utilities/summon_anchors

# Spreads the anchor entitys
spreadplayers ~ ~ 10 60 false @e[type=minecraft:area_effect_cloud,tag=nadi.anchor,distance=..0.1]
