# Description: Creat a acid_rain
# Called from: nadi:choose_disaster
# Datapck by 2mal3

# send create message
execute if score $nadi.notifications_on nadi.config matches 1 run tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] {"translate":"A acid rain begins.","color":"gray"}

# set the weather to rain
weather rain 99999

# load acid rain time
scoreboard players operation $nadi.time nadi.data = $nadi.acid_rain_time nadi.config
scoreboard players set $nadi.natural_disaster_on nadi.data 1

# some stuff for the api
function #nadi_api:acid_rain_time

# start acid rain
schedule function nadi:natural_disasters/acid_rain/tick 4s
