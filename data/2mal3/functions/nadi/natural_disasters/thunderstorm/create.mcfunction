# Description: Creat a thunderstorm
# Called from: 2mal3:nadi/choose_disaster
# Datapck by 2mal3

# send create message
execute if score $nadi.notifications_on nadi.config matches 1 run tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] {"translate":"A thunderstorm begins.","color":"gray"}

# set the weather to thunder
weather thunder 99999

# load the thunderstorm time
scoreboard players operation $nadi.time nadi.data = $nadi.thunderstorm_time nadi.config
scoreboard players set $nadi.natural_disaster_on nadi.data 1

# some stuff for the api
function #nadi_api:thunderstorm_time

# starts the thunderstorm
schedule function 2mal3:nadi/natural_disasters/thunderstorm/tick 10s
