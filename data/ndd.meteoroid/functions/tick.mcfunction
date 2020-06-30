# Description: The meteroid tick
# Called from: ndd.meteoroid:create.1, ndd.meteroid:tick
# Datapack by 2mal3

# move meteoroid
execute store result score ndd.temp ndd.data as @e[tag=ndd.meteoroid.2,type=minecraft:armor_stand] at @s run clone ~-4 ~-4 ~-4 ~4 ~4 ~4 ~-4 ~-5 ~-4 masked move
execute as @e[tag=ndd.meteoroid.2,type=minecraft:armor_stand] at @s run tp @s ~ ~-1 ~


# timer
schedule function ndd.meteoroid:tick 1t


# meteoroid impact
execute store result score ndd.temp_0 ndd.data as @e[tag=ndd.meteoroid.2,type=minecraft:armor_stand] at @s run execute unless block ~ ~-5 ~ minecraft:air
execute if score ndd.temp_0 ndd.data matches 1 as @e[tag=ndd.meteoroid.2,type=minecraft:armor_stand] at @s run clone ~-4 ~-4 ~-4 ~4 ~4 ~4 ~-4 ~-9 ~-4 masked move
execute if score ndd.temp_0 ndd.data matches 1 run function ndd.meteoroid:end
