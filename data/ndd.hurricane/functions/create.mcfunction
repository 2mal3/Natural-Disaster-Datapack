# Description: Creat a hurricane
# Called from: ndd:choose_disaster
# Datapck by 2mal3

execute if score ndd.notifications_on ndd.config matches 1 run tellraw @a {"translate":"A hurricane begins.","color":"gray"}


weather thunder 99999
execute as @a[sort=random,gamemode=!spectator,limit=1] at @s run summon minecraft:armor_stand ~ 300 ~ {Invulnerable:1b,Invisible:1b,NoBasePlate:1b,PersistenceRequired:1b,Tags:["ndd.hurricane"],Motion:[0.0,-5.0,0.0]}


scoreboard players operation ndd.time ndd.data = ndd.hurricane_time ndd.config
scoreboard players set ndd.natural_disaster_on ndd.data 1
function #ndd_api:hurricane_time

schedule function ndd.hurricane:tick 10s
