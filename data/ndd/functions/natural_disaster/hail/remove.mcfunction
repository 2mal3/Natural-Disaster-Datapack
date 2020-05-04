# Description: Removes the hail
# Called from: ndd:natural_disaster/hail/tick
# Datapck by 2mal3

schedule clear ndd:natural_disaster/hail/tick
weather clear
function ndd:new_time
scoreboard players set ndd.natural_disaster_on ndd.data 0
