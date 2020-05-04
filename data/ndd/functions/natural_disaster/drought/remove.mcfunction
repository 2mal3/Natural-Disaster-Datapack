# Description: Removes the drought
# Called from: ndd:natural_disaster/drought/tick
# Datapck by 2mal3

schedule clear ndd:natural_disaster/drought/tick
function ndd:new_time
scoreboard players set ndd.natural_disaster_on ndd.data 0
