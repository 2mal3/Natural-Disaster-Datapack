# Description: The drought tick
# Called from: ndd.drought:create, ndd.drought:tick
# Datapack by 2mal3

# convert blocks
execute if score ndd.low_graphics_mode ndd.config matches 0 as @a[gamemode=!spectator] at @s run function ndd.drought:replace_normal
execute if score ndd.low_graphics_mode ndd.config matches 1 as @a[gamemode=!spectator] at @s run function ndd.drought:replace_low


# timer
schedule function ndd.drought:tick 10t

scoreboard players remove ndd.time ndd.data 1
execute if score ndd.time ndd.data matches 0 run function ndd.drought:remove
