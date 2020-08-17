# Description: Removes the thunderstorm
# Called from: nadi.thunderstorm:tick
# Datapck by 2mal3

# send remove message
kill @e[tag=nadi.doline,type=minecraft:armor_stand]

# other
schedule clear nadi:natural_disasters/doline/tick
function nadi:new_time
scoreboard players set $nadi.natural_disaster_on nadi.data 0
