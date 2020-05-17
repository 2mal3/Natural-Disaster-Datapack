# Description: Creat a hurricane
# Called from: ndd:choose_disaster
# Datapck by 2mal3

execute if score ndd.notifications_on ndd.config matches 1 run tellraw @a {"text":"A hurricane begins.","color":"gray"}

weather thunder 99999
execute as @a[sort=random,gamemode=!spectator,limit=1] at @s run summon minecraft:armor_stand ~ 300 ~ {Invulnerable:1b,Invisible:1b,NoBasePlate:1b,PersistenceRequired:1b,Tags:["ndd.hurricane"],Motion:[0.0,-5.0,0.0]}
#execute as @a[sort=random,gamemode=!spectator,limit=1] at @s run summon minecraft:pig ~ ~ ~ {Silent:1b,Invulnerable:1b,PersistenceRequired:1b,Attributes:[{Name:generic.movementSpeed,Base:0.1}],Tags:["ndd.hurricane"],ActiveEffects:[{Id:14b,Amplifier:1b,Duration:99999,ShowParticles:0b}]}

scoreboard players operation ndd.time ndd.data = ndd.hurricane_time ndd.config
scoreboard players set ndd.natural_disaster_on ndd.data 1

schedule function ndd.hurricane:tick 10s
