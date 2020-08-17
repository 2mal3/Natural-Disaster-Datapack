# Description: Removes the thunderstorm
# Called from: nadi:natural_disasters/thunderstorm/tick
# Datapck by 2mal3

# send remove message
execute if score $nadi.notifications_on nadi.config matches 1 run tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] {"translate":"The thunderstorm stops.","color":"gray"}

# other
schedule clear nadi:natural_disasters/thunderstorm/tick
scoreboard players set $nadi.natural_disaster_on nadi.data 0
weather clear
function nadi:new_time
