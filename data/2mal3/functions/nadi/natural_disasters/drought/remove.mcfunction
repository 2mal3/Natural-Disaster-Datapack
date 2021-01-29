# Description: Removes the drought
# Called from: 2mal3:nadi/natural_disasters/drought/tick
# Datapck by 2mal3

# send remove message
execute if score $nadi.notifications_on nadi.config matches 1 run tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] {"translate":"The drought stops.","color":"gray"}

# other
schedule clear 2mal3:nadi/natural_disasters/drought/tick
function 2mal3:nadi/new_time
scoreboard players set $nadi.natural_disaster_on nadi.data 0
