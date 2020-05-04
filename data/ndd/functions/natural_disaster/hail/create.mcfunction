# Description: Creat a hail
# Called from: ndd:choose_disaster
# Datapck by 2mal3

weather rain 99999
scoreboard players set ndd.time ndd.data 0
scoreboard players set ndd.natural_disaster_on ndd.data 1
say hail
schedule function ndd:natural_disaster/hail/tick 5s
