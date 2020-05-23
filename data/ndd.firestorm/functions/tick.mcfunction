# Description: The firestorm tick
# Called from: ndd.firestorm:create, ndd.firestorm:tick
# Datapck by 2mal3

# summon fire
execute as @a[gamemode=!spectator] at @s run function ndd.firestorm:summon

execute as @a[gamemode=!spectator] at @s run spreadplayers ~ ~ 10 30 false @e[sort=nearest,limit=10,tag=ndd.firestorm.p]
execute as @e[type=minecraft:area_effect_cloud,tag=ndd.firestorm.p] at @s run summon minecraft:slime ~ ~35 ~ {NoGravity:0b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["ndd.firestorm.s"],ActiveEffects:[{Id:14b,Amplifier:1b,Duration:99999,ShowParticles:0b},{Id:28b,Amplifier:1b,Duration:99999,ShowParticles:0b}]}


# place firestorm_on
execute as @e[type=minecraft:slime,tag=ndd.firestorm.s] at @s unless block ~ ~-1 ~ minecraft:air run setblock ~ ~ ~ minecraft:fire
execute as @e[type=minecraft:slime,tag=ndd.firestorm.s] at @s unless block ~ ~-1 ~ minecraft:air run tp @s ~ -1000 ~


# timer
schedule function ndd.firestorm:tick 2s

scoreboard players remove ndd.time ndd.data 1
execute if score ndd.time ndd.data matches 0 run function ndd.firestorm:remove
