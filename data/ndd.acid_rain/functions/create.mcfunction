# Description: Creat a acid_rain
# Called from: ndd:choose_disaster
# Datapck by 2mal3

weather rain 99999
execute if score ndd.notifications_on ndd.config matches 1 run tellraw @a {"text":"The acid rain begins.","color":"gray"}

scoreboard players operation ndd.time ndd.data = ndd.acid_rain_time ndd.config
scoreboard players set ndd.natural_disaster_on ndd.data 1

schedule function ndd.acid_rain:tick 4s
