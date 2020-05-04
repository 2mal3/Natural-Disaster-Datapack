# Description: Creat a thunderstorm
# Called from: ndd:choose_disaster
# Datapck by 2mal3

weather thunder 99999
scoreboard players set ndd.time ndd.data 0
scoreboard players set ndd.natural_disaster_on ndd.data 1
say thunderstorm
schedule function ndd:natural_disaster/thunderstorm/tick 10s
