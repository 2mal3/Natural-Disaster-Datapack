# Description: The drought tick
# Called from: ndd:natural_disaster/drought/create
# Datapck by 2mal3

# convert blocks
execute as @a[gamemode=!spectator] at @s run fill ~-6 ~-6 ~-6 ~6 ~6 ~6 minecraft:air replace #ndd:drought_remove
execute as @a[gamemode=!spectator] at @s run fill ~-6 ~-6 ~-6 ~6 ~6 ~6 minecraft:sand replace minecraft:grass_block
execute as @a[gamemode=!spectator] at @s run fill ~-6 ~-6 ~-6 ~6 ~6 ~6 minecraft:sandstone replace minecraft:dirt
execute as @a[gamemode=!spectator] at @s run fill ~-6 ~-6 ~-6 ~6 ~6 ~6 minecraft:sandstone replace minecraft:coarse_dirt


# timer
schedule function ndd:natural_disaster/drought/tick 10t

scoreboard players add ndd.time ndd.data 1
execute if score ndd.time ndd.data matches 600 run function ndd:natural_disaster/drought/remove
