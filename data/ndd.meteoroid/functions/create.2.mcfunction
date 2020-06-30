# Description: Creat a meteroid
# Called from: ndd.meteoroid.1
# Datapck by 2mal3

# summon fireball
summon minecraft:fireball ~ 225 ~ {ExplosionPower:150,direction:[0.0,0.0,0.0],power:[0.0,-0.05,0.0],Tags:["ndd.meteoroid.1"]}

# place meteoroid
summon minecraft:armor_stand ~ 230 ~ {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:0b,PersistenceRequired:1b,Tags:["ndd.meteoroid.2"],Rotation:[0F,180F]}
execute as @e[tag=ndd.meteoroid.2,type=minecraft:armor_stand] at @s run tp @s ~ ~ ~ 0 180
execute as @e[tag=ndd.meteoroid.2,type=minecraft:armor_stand] at @s run setblock ~-4 ~-4 ~-4 minecraft:structure_block[mode=load]{name:"ndd.meteoroid:meteoroid",rotation:"NONE",mirror:"NONE",mode:"LOAD"} replace
execute as @e[tag=ndd.meteoroid.2,type=minecraft:armor_stand] at @s run setblock ~-4 ~-3 ~-4 minecraft:redstone_block
