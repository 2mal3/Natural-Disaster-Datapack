# Description: The firestorm tick
# Called from: ndd:natural_disaster/firestorm/create
# Datapck by 2mal3

# summon fire
execute as @a[gamemode=!spectator] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["ndd.firestorm.p"]}
execute as @a[gamemode=!spectator] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["ndd.firestorm.p"]}
execute as @a[gamemode=!spectator] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["ndd.firestorm.p"]}
execute as @a[gamemode=!spectator] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["ndd.firestorm.p"]}
execute as @a[gamemode=!spectator] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["ndd.firestorm.p"]}
execute as @a[gamemode=!spectator] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["ndd.firestorm.p"]}
execute as @a[gamemode=!spectator] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["ndd.firestorm.p"]}
execute as @a[gamemode=!spectator] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["ndd.firestorm.p"]}
execute as @a[gamemode=!spectator] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["ndd.firestorm.p"]}
execute as @a[gamemode=!spectator] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["ndd.firestorm.p"]}


execute as @a[gamemode=!spectator] at @s run spreadplayers ~ ~ 10 30 false @e[sort=nearest,limit=10,tag=ndd.firestorm.p]
execute as @e[tag=ndd.firestorm.p] at @s run summon minecraft:slime ~ ~35 ~ {NoGravity:0b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["ndd.firestorm.s"],ActiveEffects:[{Id:14b,Amplifier:1b,Duration:99999,ShowParticles:0b},{Id:28b,Amplifier:1b,Duration:99999,ShowParticles:0b}]}


# timer
schedule function ndd:natural_disaster/firestorm/tick 3s

scoreboard players add ndd.time ndd.data 1
execute if score ndd.time ndd.data matches 45 run schedule clear ndd:natural_disaster/firestorm/tick
execute if score ndd.time ndd.data matches 45 run function ndd:natural_disaster/firestorm/remove
