# Description: The firestorm tick
# Called from: nadi:natural_disasters/firestorm/create, nadi:natural_disasters/firestorm/tick
# Datapck by 2mal3

# summon fire
execute as @a[gamemode=!spectator,tag=!global.ignore] at @s run function nadi:natural_disasters/firestorm/summon

execute as @a[gamemode=!spectator,tag=!global.ignore] at @s run spreadplayers ~ ~ 10 30 false @e[sort=nearest,limit=10,tag=nadi.firestorm.p]
execute as @e[type=minecraft:area_effect_cloud,tag=nadi.firestorm.p] at @s run summon minecraft:slime ~ ~35 ~ {NoGravity:0b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["nadi.firestorm.s"],ActiveEffects:[{Id:14b,Amplifier:1b,Duration:99999,ShowParticles:0b},{Id:28b,Amplifier:1b,Duration:99999,ShowParticles:0b}]}


# make fire if the falling flames tuch the ground
execute as @e[type=minecraft:slime,tag=nadi.firestorm.s] at @s unless block ~ ~-1 ~ minecraft:air run setblock ~ ~ ~ minecraft:fire
execute as @e[type=minecraft:slime,tag=nadi.firestorm.s] at @s unless block ~ ~-1 ~ minecraft:air run tp @s ~ -1000 ~


# timer
schedule function nadi:natural_disasters/firestorm/tick 2s

scoreboard players remove $nadi.time nadi.data 1
execute if score $nadi.time nadi.data matches 0 run function nadi:natural_disasters/firestorm/remove
