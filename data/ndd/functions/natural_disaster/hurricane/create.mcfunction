# Description: Creat a hurricane
# Called from: ndd:choose_disaster
# Datapck by 2mal3

weather thunder 99999
execute as @a[sort=random,gamemode=!spectator,limit=1] at @s run summon minecraft:armor_stand ~ ~ ~ {Invulnerable:1b,Marker:1b,Invisible:1b,NoBasePlate:1b,PersistenceRequired:1b,Tags:["ndd.hurricane"]}
say hurricane

scoreboard players set ndd.time ndd.data 0
scoreboard players operation ndd.time ndd.data += ndd.hurricane_time ndd.config
scoreboard players set ndd.natural_disaster_on ndd.data 1

schedule function ndd:natural_disaster/hurricane/tick 10s
