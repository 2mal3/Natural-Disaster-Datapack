# Description: Removes the acid_rain
# Called from: 2mal3:nadi/natural_disasters/acid_rain/tick
# Datapack by 2mal3

# send remove message
execute if score $nadi.notifications_on nadi.config matches 1 run tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] {"translate":"The acid rain stops.","color":"gray"}

# clear weather 
weather clear

# don't want to commend :)
schedule clear 2mal3:nadi/natural_disasters/acid_rain/tick
function 2mal3:nadi/new_time
scoreboard players set $nadi.natural_disaster_on nadi.data 0
