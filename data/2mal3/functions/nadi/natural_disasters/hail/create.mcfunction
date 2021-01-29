# Description: Creat a hail
# Called from: 2mal3:nadi/choose_disaster
# Datapck by 2mal3

# set the weather to rain
weather rain 99999

# send create message
execute if score $nadi.notifications_on nadi.config matches 1 run tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] {"translate":"A hail begins.","color":"gray"}

# load diesaster time
scoreboard players operation $nadi.time nadi.data = $nadi.hail_time nadi.config
scoreboard players set $nadi.natural_disaster_on nadi.data 1

# some stuff for the api
function #nadi_api:hail_time

# start hail
schedule function 2mal3:nadi/natural_disasters/hail/tick 5s
