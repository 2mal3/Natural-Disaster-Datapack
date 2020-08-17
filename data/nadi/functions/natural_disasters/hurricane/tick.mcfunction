# Description: The hurricane tick
# Called from: nadi:natural_disasters/hurricane/create, nadi:natural_disasters/hurricane/tick
# Datapck by 2mal3

# show hurricane particles
execute as @e[type=minecraft:pig,tag=nadi.hurricane] at @s run function nadi:natural_disasters/hurricane/particle

# sound effects
execute as @e[type=minecraft:pig,tag=nadi.hurricane] at @s if entity @p[distance=..60] as @a[distance=..60,tag=!global.ignore,tag=!global.ignore.gui] at @s run function nadi:natural_disasters/hurricane/sound

# Catch entitys
execute as @e[type=minecraft:pig,tag=nadi.hurricane] at @s run function nadi:natural_disasters/hurricane/catch

# make falling blocks
execute if predicate nadi:hurricane/random_break_block as @e[type=minecraft:pig,tag=nadi.hurricane] at @s run function nadi:natural_disasters/hurricane/break

# no sleep
execute as @a[gamemode=!spectator,tag=!global.ignore] at @s if block ~ ~ ~ #minecraft:beds run tp @s ~ ~ ~


# timer
schedule function nadi:natural_disasters/hurricane/tick 2t

scoreboard players remove $nadi.time nadi.data 1
execute if score $nadi.time nadi.data matches 0 run function nadi:natural_disasters/hurricane/remove
