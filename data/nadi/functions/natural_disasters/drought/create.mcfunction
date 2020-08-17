# Description: Creat a drought
# Called from: nadi:choose_disaster
# Datapck by 2mal3

#send create message
execute if score $nadi.notifications_on nadi.config matches 1 run tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] {"translate":"A drought begins.","color":"gray"}

# loads drought time
scoreboard players operation $nadi.time nadi.data = $nadi.drought_time nadi.config
scoreboard players set $nadi.natural_disaster_on nadi.data 1

# some stuff for tha api
function #nadi_api:drought_time

# starts the drought
schedule function nadi:natural_disasters/drought/tick 5s
