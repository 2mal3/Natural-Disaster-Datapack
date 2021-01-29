# Description: catches the entitys
# Called from: 2mal3:nadi/natural_disasters/hurricane/tick
# Datapack by 2mal3

# save all cached players
execute positioned ~-30 ~ ~-30 run tag @e[dx=60,dy=50,dz=60,tag=!global.ignore,tag=!global.ignore.pos] add nadi.catch
tag @e[type=minecraft:pig,tag=nadi.hurricane] remove nadi.catch

# give effects for players
effect give @a[tag=nadi.catch,tag=!global.ignore,tag=!global.ignore.pos] minecraft:levitation 3 255 true
execute positioned ~-30 ~25 ~-30 run effect give @e[dx=60,dy=10,dz=60,tag=!global.ignore,tag=!global.ignore.kill] minecraft:wither 2 0 true

# remove old and summon new ancor entity
kill @e[tag=nadi.hurricane_catch,type=minecraft:area_effect_cloud]
summon minecraft:area_effect_cloud ~ ~25 ~ {Tags:["nadi.hurricane_catch","global.ignore"]}

# move entitys to the hurricane center
execute as @e[tag=nadi.catch,tag=!nadi.hurricane_catch,tag=!global.ignore,tag=!global.ignore.pos,tag=!nadi.hurricane.ignore] at @s facing entity @e[tag=nadi.hurricane_catch,type=minecraft:area_effect_cloud,sort=nearest,limit=1] feet run tp @s ^0.1 ^ ^0.1
execute as @e[tag=nadi.catch,tag=!nadi.hurricane_catch,tag=!global.ignore,tag=!global.ignore.pos,tag=!nadi.hurricane.ignore] at @s facing entity @e[tag=nadi.hurricane_catch,type=minecraft:area_effect_cloud,sort=nearest,limit=1] feet run tp @s ^0.1 ^ ^0.1
execute as @e[tag=nadi.catch,tag=!nadi.hurricane_catch,tag=!global.ignore,tag=!global.ignore.pos,tag=!nadi.hurricane.ignore] at @s facing entity @e[tag=nadi.hurricane_catch,type=minecraft:area_effect_cloud,sort=nearest,limit=1] feet run tp @s ^0.1 ^ ^0.1

# shot near blocks away
execute as @e[type=minecraft:area_effect_cloud,tag=nadi.hurricane_catch] at @s as @e[type=minecraft:falling_block,distance=..5] at @s run function 2mal3:nadi/natural_disasters/hurricane/random_motion


tag @e[tag=nadi.catch] remove nadi.catch