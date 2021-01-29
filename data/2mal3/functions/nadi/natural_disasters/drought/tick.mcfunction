# Description: The drought tick
# Called from: 2mal3:nadi/natural_disasters/drought/create, 2mal3:nadi/natural_disasters/drought/tick
# Datapack by 2mal3

# convert blocks
execute as @a[gamemode=!spectator,tag=!global.ignore] at @s run function 2mal3:nadi/natural_disasters/drought/replace


# timer
schedule function 2mal3:nadi/natural_disasters/drought/tick 10t

scoreboard players remove $nadi.time nadi.data 1
execute if score $nadi.time nadi.data matches 0 run function 2mal3:nadi/natural_disasters/drought/remove
