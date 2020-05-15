# Description: Creat a drought
# Called from: ndd:choose_disaster
# Datapck by 2mal3

say drought

scoreboard players operation ndd.time ndd.data = ndd.drought_time ndd.config
scoreboard players set ndd.natural_disaster_on ndd.data 1

schedule function ndd:natural_disaster/drought/tick 5s
