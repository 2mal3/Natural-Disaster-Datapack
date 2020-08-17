# Description: Removes the firestorm
# Called from: nadi:natural_disasters/firestorm/tick
# Datapck by 2mal3

# send remove message
execute if score $nadi.notifications_on nadi.config matches 1 run tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] {"translate":"The firestorm stops.","color":"gray"}

# remove firetails
tp @e[tag=nadi.firestorm.s,type=minecraft:slime] ~ -1000 ~

# other
schedule clear nadi:natural_disasters/firestorm/tick
scoreboard players set $nadi.firestorm_on nadi.data 0
function nadi:new_time
scoreboard players set $nadi.natural_disaster_on nadi.data 0
