# Description: Creat a thunderstorm
# Called from: ndd:choose_disaster
# Datapck by 2mal3


execute as @r[limit=1] at @s run summon minecraft:armor_stand ~ ~ ~ {Invulnerable:1b,Invisible:1b,PersistenceRequired:1b,Motion:[0.0,-1.0,0.0],Tags:["ndd.doline"]}
playsound minecraft:ambient.cave master @a ~ ~ ~ 10
scoreboard players set ndd.time ndd.data 0
scoreboard players set ndd.natural_disaster_on ndd.data 1
say doline
schedule function ndd:natural_disaster/doline/tick 2s
