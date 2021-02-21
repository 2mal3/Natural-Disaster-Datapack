# Description: Summons a set number of entity anchors
# Called from function: ...
# Datapck by 2mal3

# Summons the anchor
summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["nadi.anchor"]}

# Calls the function again if not all anchors have been created yet
scoreboard players remove $nadi.temp_0 nadi.data 1
execute if score $nadi.temp_0 nadi.data matches 1.. run function 2mal3:nadi/libraries/summon_anchors