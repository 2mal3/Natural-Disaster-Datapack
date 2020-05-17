# Description: The drought tick
# Called from: ndd.drought:create, ndd.drought:tick
# Datapck by 2mal3

# convert blocks
execute as @a[gamemode=!spectator] at @s run fill ~-6 ~-6 ~-6 ~6 ~6 ~6 minecraft:air replace #ndd.drought:drought_remove
execute as @a[gamemode=!spectator] at @s run fill ~-6 ~-6 ~-6 ~6 ~6 ~6 minecraft:dead_bush replace #minecraft:flowers
execute as @a[gamemode=!spectator] at @s run fill ~-6 ~-6 ~-6 ~6 ~6 ~6 minecraft:sand replace minecraft:grass_block
execute as @a[gamemode=!spectator] at @s run fill ~-6 ~-6 ~-6 ~6 ~6 ~6 minecraft:sandstone replace minecraft:dirt
execute as @a[gamemode=!spectator] at @s run fill ~-6 ~-6 ~-6 ~6 ~6 ~6 minecraft:sandstone replace minecraft:coarse_dirt


# timer
schedule function ndd.drought:tick 10t

scoreboard players remove ndd.time ndd.data 1
execute if score ndd.time ndd.data matches 0 run function ndd.drought:remove
