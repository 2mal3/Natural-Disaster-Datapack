# Description: Creat a acid_rain
# Called from: ndd:choose_disaster
# Datapck by 2mal3

weather rain 99999
scoreboard players operation ndd.time ndd.data += ndd.acid_rain_time ndd.config
scoreboard players set ndd.natural_disaster_on ndd.data 1
say acid_rain
schedule function ndd:natural_disaster/acid_rain/tick 4s
