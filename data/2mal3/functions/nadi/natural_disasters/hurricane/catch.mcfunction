# Description: Pulls all entitys to the center of the hurricane and deals damage to them there
# AS: hurricane anchor cow, AT: @s
# Called from function: 2mal3:nadi/natural_disasters/hurricane/ticks/tick
# Datapack by 2mal3

# Temporarily stores which entitys can be pulled in by the hurricane
tag @e[tag=nadi.catch] remove nadi.catch
execute positioned ~-30 ~-5 ~-30 run tag @e[dx=60,dy=55,dz=60,tag=!global.ignore,tag=!global.ignore.pos,tag=!nadi.hurricane.ignore] add nadi.catch

# Prevents players pulled by the hurricane from falling down
effect give @a[tag=nadi.catch] minecraft:levitation 3 255 true
# Deals damage to all entities that are in the center of the hurricane
execute positioned ~-30 ~25 ~-30 run effect give @e[dx=60,dy=10,dz=60,tag=!global.ignore] minecraft:wither 2 0 true

# Creates an anchor entity
summon minecraft:area_effect_cloud ~ ~25 ~ {Tags: ["nadi.anchor_1"]}
# Moves entities that can be pulled to the center of the hurricane
execute as @e[tag=nadi.catch] at @s facing entity @e[type=minecraft:area_effect_cloud,tag=nadi.anchor_1] feet run tp @s ^0.1 ^ ^0.1
execute as @e[tag=nadi.catch] at @s facing entity @e[type=minecraft:area_effect_cloud,tag=nadi.anchor_1] feet run tp @s ^0.1 ^ ^0.1
execute as @e[tag=nadi.catch] at @s facing entity @e[type=minecraft:area_effect_cloud,tag=nadi.anchor_1] feet run tp @s ^0.1 ^ ^0.1

# Shoots away lifted blocks that arrived in the middle of the hurricane in a random direction
execute positioned ~ ~25 ~ as @e[type=minecraft:falling_block,distance=..5] at @s run function 2mal3:nadi/natural_disasters/hurricane/random_motion
