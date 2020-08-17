# Description: Creat a firestorm
# Called from: nadi:choose_disaster
# Datapck by 2mal3

# send create message
execute if score $nadi.notifications_on nadi.config matches 1 run tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] {"translate":"A firestorm begins.","color":"gray"}

# load config time
scoreboard players operation $nadi.time nadi.data = $nadi.firestorm_time nadi.config
scoreboard players set $nadi.firestorm_on nadi.data 1
scoreboard players set $nadi.natural_disaster_on nadi.data 1

# some stuff for the api
function #nadi_api:firestorm_time

# start firestorm
schedule function nadi:natural_disasters/firestorm/tick 6s
