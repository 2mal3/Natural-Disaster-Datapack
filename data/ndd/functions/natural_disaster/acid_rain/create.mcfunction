# Description: Creat a acid_rain
# Called from: ndd:choose_disaster
# Datapck by 2mal3

weather rain 99999
say acid_rain

scoreboard players set ndd.time ndd.data 0
scoreboard players operation ndd.time ndd.data += ndd.acid_rain_time ndd.config
scoreboard players set ndd.natural_disaster_on ndd.data 1

schedule function ndd:natural_disaster/acid_rain/tick 4s
