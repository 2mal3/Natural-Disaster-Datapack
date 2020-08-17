# Description: Creat a sandstorm
# Called from: nadi:choose_disaster
# Datapack by 2mal3

# send create message
execute if score $nadi.notifications_on nadi.config matches 1 run tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] {"translate":"A sandstorm begins.","color":"gray"}

# load sandstorm time and enables sandstorm particles
scoreboard players operation $nadi.time nadi.data = $nadi.sandstorm_time nadi.config
scoreboard players set $nadi.natural_disaster_on nadi.data 1
scoreboard players set $nadi.sandstorm nadi.data 1

# some stuff for the api
function #nadi_api:sandstorm_time

# start sandstorm
schedule function nadi:natural_disasters/sandstorm/tick 4s
