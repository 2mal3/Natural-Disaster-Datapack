# Description: Removes the hurricane
# Called from: ndd:natural_disaster/hurricane/tick
# Datapck by 2mal3

schedule clear ndd:natural_disaster/hurricane/tick
tp @e[tag=ndd.hurricane,type=minecraft:armor_stand] ~ -1000 ~
weather clear

function ndd:new_time
scoreboard players set ndd.natural_disaster_on ndd.data 0
