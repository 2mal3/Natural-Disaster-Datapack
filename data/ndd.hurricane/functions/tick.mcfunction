# Description: The hurricane tick
# Called from: ndd.hurricane:create, ndd.hurricane:tick
# Datapck by 2mal3

# show hurricane particles
execute as @e[tag=ndd.hurricane,type=minecraft:armor_stand] at @s run function ndd.hurricane:particle

# Catch entitys
execute as @e[tag=ndd.hurricane,type=minecraft:armor_stand] at @s run function ndd.hurricane:catch

# no sleep
execute as @a[gamemode=!spectator] at @s if block ~ ~ ~ #minecraft:beds run tp @s ~ ~ ~


# timer
schedule function ndd.hurricane:tick 2t

scoreboard players remove ndd.time ndd.data 1
execute if score ndd.time ndd.data matches 0 run function ndd.hurricane:remove