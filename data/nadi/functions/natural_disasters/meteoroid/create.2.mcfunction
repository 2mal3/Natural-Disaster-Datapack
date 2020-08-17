# Description: Creat a meteroid
# Called from: nadi:natural_disasters/meteoroid/create.1
# Datapck by 2mal3

# summon fireball
summon minecraft:fireball ~ 220 ~ {ExplosionPower:150,direction:[0.0,0.0,0.0],power:[0.0,-0.05,0.0],Tags:["nadi.meteoroid.1","global.ignore"]}

# place meteoroid
summon minecraft:armor_stand ~ 230 ~ {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:0b,Tags:["nadi.meteoroid.2","global.ignore"],Rotation:[0F,180F]}
execute as @e[tag=nadi.meteoroid.2,type=minecraft:armor_stand] at @s run tp @s ~ ~ ~ 0 180
execute as @e[tag=nadi.meteoroid.2,type=minecraft:armor_stand] at @s run setblock ~-4 ~-4 ~-4 minecraft:structure_block[mode=load]{name:"nadi:meteoroid/meteoroid",rotation:"NONE",mirror:"NONE",mode:"LOAD"} replace
execute as @e[tag=nadi.meteoroid.2,type=minecraft:armor_stand] at @s run setblock ~-4 ~-3 ~-4 minecraft:redstone_block
