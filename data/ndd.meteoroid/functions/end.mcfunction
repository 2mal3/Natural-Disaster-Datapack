# Description: Destroy the area and stops the meteoroid
# Called from: ndd.meteroid:tick
# Datapck by 2mal3


# remove armor stand
kill @e[type=minecraft:armor_stand,tag=ndd.meteoroid.2]


schedule clear ndd.meteoroid:tick
function ndd:new_time
scoreboard players set ndd.natural_disaster_on ndd.data 0
