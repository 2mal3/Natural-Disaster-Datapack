# Description: Removes the hurricane
# Called from: 2mal3:nadi/natural_disasters/hurricane/tick
# Datapck by 2mal3

# send remove message
execute if score $nadi.notifications_on nadi.config matches 1 run tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] {"translate":"The hurricane stops.","color":"gray"}

# remove all suff  from the hurricane
execute as @e[type=minecraft:pig,tag=nadi.hurricane] at @s run kill @e[type=minecraft:falling_block,distance=..100,tag=!global.ignore,tag=!global.ignore.kill]
tp @e[type=minecraft:pig,tag=nadi.hurricane] ~ -1000 ~
weather clear
scoreboard players reset @a[scores={nadi.sound=1..}] nadi.sound

# other
schedule clear 2mal3:nadi/natural_disasters/hurricane/tick
function 2mal3:nadi/new_time
scoreboard players set $nadi.natural_disaster_on nadi.data 0
