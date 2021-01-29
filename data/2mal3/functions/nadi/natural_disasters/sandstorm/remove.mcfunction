# Description: Removes the sandstorm
# Called from: 2mal3:nadi/natural_disasters/sandstorm/tick
# Datapack by 2mal3

# send remove message
execute if score $nadi.notifications_on nadi.config matches 1 run tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] {"translate":"The sandstorm stops.","color":"gray"}

schedule clear 2mal3:nadi/natural_disasters/sandstorm/tick
scoreboard players set $nadi.natural_disaster_on nadi.data 0
scoreboard players set $nadi.sandstorm nadi.data 0
function 2mal3:nadi/new_time
