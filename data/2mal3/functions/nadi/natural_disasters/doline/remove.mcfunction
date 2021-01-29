# Description: Removes the thunderstorm
# Called from: nadi.thunderstorm:tick
# Datapck by 2mal3

# send remove message
kill @e[tag=nadi.doline,type=minecraft:armor_stand]

# other
schedule clear 2mal3:nadi/natural_disasters/doline/tick
function 2mal3:nadi/new_time
scoreboard players set $nadi.natural_disaster_on nadi.data 0
