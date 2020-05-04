# Description: Removes the firestorm
# Called from: ndd:natural_disaster/firestorm/tick
# Datapck by 2mal3

scoreboard players set ndd.firestorm_on ndd.data 0
tp @e[tag=ndd.firestorm.s] ~ -1000 ~
function ndd:new_time
scoreboard players set ndd.natural_disaster_on ndd.data 0
