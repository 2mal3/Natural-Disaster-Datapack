# Description: Destroy the area and stops the meteoroid
# Called from: nadi.meteroid:tick
# Datapck by 2mal3

# move meteoroide
execute as @e[tag=nadi.meteoroid.2,type=minecraft:armor_stand] at @s run clone ~-4 ~-4 ~-4 ~4 ~4 ~4 ~-4 ~-9 ~-4 masked move

# remove armor stand
kill @e[type=minecraft:armor_stand,tag=nadi.meteoroid.2]

# other
schedule clear 2mal3:nadi/natural_disasters/meteoroid/tick
scoreboard players set $nadi.natural_disaster_on nadi.data 0
function 2mal3:nadi/new_time
