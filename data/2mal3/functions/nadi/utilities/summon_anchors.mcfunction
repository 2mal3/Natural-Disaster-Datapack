# Description: Summons a set number of entity anchors
# Datapack by 2mal3

# Summons a new anchor
summon minecraft:area_effect_cloud ~ ~ ~ {Tags: ["nadi.anchor"]}

# Calls the function again if not all anchors have been created yet
scoreboard players remove .temp_0 nadi.data 1
execute unless score .temp_0 nadi.data matches 0 run function 2mal3:nadi/utilities/summon_anchors
