# Description: Removes the thunderstorm
# Called from: ndd:natural_disaster/thunderstorm/tick
# Datapck by 2mal3

schedule clear ndd:natural_disaster/thunderstorm/tick
weather clear
function ndd:new_time
scoreboard players set ndd.natural_disaster_on ndd.data 0
