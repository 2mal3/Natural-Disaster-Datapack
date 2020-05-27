# Description: Creat a thunderstorm
# Called from: ndd:choose_disaster
# Datapck by 2mal3


execute as @r[limit=1] at @s run summon minecraft:armor_stand ~ ~ ~ {Invulnerable:1b,Invisible:1b,PersistenceRequired:1b,Motion:[0.0,-1.0,0.0],Tags:["ndd.doline"]}
playsound minecraft:ambient.cave master @a ~ ~ ~ 10
execute if score ndd.notifications_on ndd.config matches 1 run tellraw @a {"translate":"A doline begins.","color":"gray"}

scoreboard players operation ndd.time ndd.data = ndd.doline_time ndd.config
scoreboard players set ndd.natural_disaster_on ndd.data 1

schedule function ndd.doline:tick 2s
