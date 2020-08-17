# Description: Creat a blizzard
# Called from: nadi:choose_disaster
# Datapack by 2mal3

# send create message
execute if score $nadi.notifications_on nadi.config matches 1 run tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] {"translate":"A blizzard begins.","color":"gray"}

# load blizzard time and enable particles
scoreboard players operation $nadi.time nadi.data = $nadi.blizzard_time nadi.config
scoreboard players set $nadi.natural_disaster_on nadi.data 1
scoreboard players set $nadi.blizzard nadi.data 1

# some stuff for the api
function #nadi_api:blizzard_time

# start blizzard
schedule function nadi:natural_disasters/blizzard/tick 4s
