# Description: Prints out if something is wrong with the world
# AS: server, AT: server
# Called from function: 2mal3:nadi/first_join/join
# Datapack by 2mal3

execute unless score .temp_0 nadi.data matches 2724.. run tellraw @a[tag=!nola.this] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"dark_red"},{"text":"/","color":"gray"},{"text":"FATAL","color":"dark_red"},{"text": "/","color": "gray"},{"text": "Server","color": "dark_red"},{"text":"]: ","color":"gray"},{"text":"This Minecraft version is not supported by the datapack. Please use a version later than 1.17.","color":"dark_red"}]
execute if score .temp_1 nadi.data matches 1 run tellraw @a[tag=!nola.this] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"gold"},{"text":"/","color":"gray"},{"text":"WARN","color":"gold"},{"text": "/","color": "gray"},{"text": "Server","color": "gold"},{"text":"]: ","color":"gray"},{"text":"This server software is not supported by the datapack, so errors may occur. Please use another server software for better stability.","color":"gold"}]
execute unless score $du.ver load matches 2020104.. run tellraw @a[tag=!nola.this] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"red"},{"text":"/","color":"gray"},{"text":"ERROR","color":"red"},{"text": "/","color": "gray"},{"text": "Server","color": "red"},{"text":"]: ","color":"gray"},{"text":"Datapack Utilities not installed or out of date. Please use the latest version of Datapack Utilities to make the datapack work properly.","color":"red"}]
execute unless score .temp_2 nadi.data matches 0 run tellraw @a[tag=!nola.this] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"red"},{"text":"/","color":"gray"},{"text":"ERROR","color":"red"},{"text": "/","color": "gray"},{"text": "Server","color": "red"},{"text":"]: ","color":"gray"},{"text":"Command blocks are disabled on the server. Please enable command blocks in the server settings.","color":"red"}]
setblock 7162814 2 5656277 minecraft:stone

tag @s remove nola.this
