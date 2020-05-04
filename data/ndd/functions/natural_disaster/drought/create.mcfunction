# Description: Creat a drought
# Called from: ndd:choose_disaster
# Datapck by 2mal3

scoreboard players set ndd.time ndd.data 0
scoreboard players set ndd.natural_disaster_on ndd.data 1
say drought
schedule function ndd:natural_disaster/drought/tick 5s
