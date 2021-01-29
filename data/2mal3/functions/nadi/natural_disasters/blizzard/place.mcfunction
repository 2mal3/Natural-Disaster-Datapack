# Description: places snow layers
# Called from: 2mal3:nadi/choose_disaster
# Datapack by 2mal3

execute if block ~ ~ ~ minecraft:snow[layers=7] run setblock ~ ~ ~ minecraft:snow[layers=8] replace
execute if block ~ ~ ~ minecraft:snow[layers=6] run setblock ~ ~ ~ minecraft:snow[layers=7] replace
execute if block ~ ~ ~ minecraft:snow[layers=5] run setblock ~ ~ ~ minecraft:snow[layers=6] replace
execute if block ~ ~ ~ minecraft:snow[layers=4] run setblock ~ ~ ~ minecraft:snow[layers=5] replace
execute if block ~ ~ ~ minecraft:snow[layers=3] run setblock ~ ~ ~ minecraft:snow[layers=4] replace
execute if block ~ ~ ~ minecraft:snow[layers=2] run setblock ~ ~ ~ minecraft:snow[layers=3] replace
execute if block ~ ~ ~ minecraft:snow[layers=1] run setblock ~ ~ ~ minecraft:snow[layers=2] replace
execute unless block ~ ~ ~ minecraft:snow run setblock ~ ~ ~ minecraft:snow[layers=1]

kill @s
