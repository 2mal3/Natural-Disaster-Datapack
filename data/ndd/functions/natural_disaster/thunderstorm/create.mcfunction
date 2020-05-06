# Description: Creat a thunderstorm
# Called from: ndd:choose_disaster
# Datapck by 2mal3

weather thunder 99999
scoreboard players operation ndd.time ndd.data += ndd.thunderstorm_time ndd.config
scoreboard players set ndd.natural_disaster_on ndd.data 1
say thunderstorm
schedule function ndd:natural_disaster/thunderstorm/tick 10s
