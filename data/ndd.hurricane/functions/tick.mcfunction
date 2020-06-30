# Description: The hurricane tick
# Called from: ndd.hurricane:create, ndd.hurricane:tick
# Datapck by 2mal3

# move hurricane armor stand
execute as @e[type=minecraft:pig,tag=ndd.hurricane.2] at @s run tp @e[type=minecraft:armor_stand,tag=ndd.hurricane.1] ~ ~ ~

# show hurricane particles
execute as @e[type=minecraft:armor_stand,tag=ndd.hurricane.1] at @s run function ndd.hurricane:particle

# Catch entitys
execute as @e[type=minecraft:armor_stand,tag=ndd.hurricane.1] at @s run function ndd.hurricane:catch

# make falling blocks
execute if predicate ndd.hurricane:random as @e[type=minecraft:armor_stand,tag=ndd.hurricane.1] at @s run function ndd.hurricane:break

# no sleep
execute as @a[gamemode=!spectator] at @s if block ~ ~ ~ #minecraft:beds run tp @s ~ ~ ~


# timer
schedule function ndd.hurricane:tick 2t

scoreboard players remove ndd.time ndd.data 1
execute if score ndd.time ndd.data matches 0 run function ndd.hurricane:remove
