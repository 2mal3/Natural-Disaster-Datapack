# Description: Removes the hail
# Called from: nadi:natural_disasters/hail/tick
# Datapck by 2mal3

# send remove message
execute if score $nadi.notifications_on nadi.config matches 1 run tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] {"translate":"The hail stops.","color":"gray"}

# clear the weather
weather clear

# other
schedule clear nadi:natural_disasters/hail/tick
function nadi:new_time
scoreboard players set $nadi.natural_disaster_on nadi.data 0
