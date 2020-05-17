# Description: Creat a firestorm
# Called from: ndd:choose_disaster
# Datapck by 2mal3

execute if score ndd.notifications_on ndd.config matches 1 run tellraw @a {"text":"A firestorm begins.","color":"gray"}

scoreboard players set ndd.firestorm_on ndd.data 1
scoreboard players set ndd.natural_disaster_on ndd.data 1
scoreboard players operation ndd.time ndd.data = ndd.firestorm_time ndd.config

schedule function ndd.firestorm:tick 6s
