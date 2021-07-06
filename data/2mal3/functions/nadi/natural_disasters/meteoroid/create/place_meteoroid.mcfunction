# Description: Creates the meteorite over a random player in the overworld who is not a spectator
# AS: random player in the overwold, AT: @s
# Called from function: 2mal3:nadi/natural_disasters/meteoroid/create/create
# Datapck by 2mal3

# Creates a fireball that flies down at the maximum build height
summon minecraft:fireball ~ 220 ~ {ExplosionPower: 100, power: [0.0d, -0.05d, 0.0d], Tags: ["global.ignore"]}
# Places the meteorite structure at 230
summon area_effect_cloud ~ 230 ~ {Duration: 2147483647, Tags: ["nadi.meteoroid", "global.ignore"]}
execute as @e[type=minecraft:area_effect_cloud,tag=nadi.meteoroid] at @s run setblock ~-4 ~-4 ~-4 minecraft:structure_block[mode=load]{name: "2mal3:nadi/meteoroid", rotation: "NONE", mirror: "NONE", mode: "LOAD"} replace
execute as @e[type=minecraft:area_effect_cloud,tag=nadi.meteoroid] at @s run setblock ~-4 ~-3 ~-4 minecraft:redstone_block
