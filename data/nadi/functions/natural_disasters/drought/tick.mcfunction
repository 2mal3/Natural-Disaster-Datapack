# Description: The drought tick
# Called from: nadi:natural_disasters/drought/create, nadi:natural_disasters/drought/tick
# Datapack by 2mal3

# convert blocks
execute as @a[gamemode=!spectator,tag=!global.ignore] at @s run function nadi:natural_disasters/drought/replace


# timer
schedule function nadi:natural_disasters/drought/tick 10t

scoreboard players remove $nadi.time nadi.data 1
execute if score $nadi.time nadi.data matches 0 run function nadi:natural_disasters/drought/remove
