# Description: Creat a firestorm
# Called from: ndd:choose_disaster
# Datapck by 2mal3

say firestorm

scoreboard players set ndd.firestorm_on ndd.data 1
scoreboard players set ndd.time ndd.data 0
scoreboard players operation ndd.time ndd.data += ndd.firestorm_time ndd.config
scoreboard players set ndd.natural_disaster_on ndd.data 1

schedule function ndd:natural_disaster/firestorm/tick 6s
