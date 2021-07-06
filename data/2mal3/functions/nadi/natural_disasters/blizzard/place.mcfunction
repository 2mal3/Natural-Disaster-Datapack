# Description: Sets snow layers, depending on the already existing snow layers
# AS: snowflake that lies on the ground
# Called from function: 2mal3:nadi/natural_disasters/blizzard/second
# Datapack by 2mal3

# Set the snow
execute if block ~ ~ ~ minecraft:snow[layers=7] run setblock ~ ~ ~ minecraft:snow[layers=8] replace
execute if block ~ ~ ~ minecraft:snow[layers=6] run setblock ~ ~ ~ minecraft:snow[layers=7] replace
execute if block ~ ~ ~ minecraft:snow[layers=5] run setblock ~ ~ ~ minecraft:snow[layers=6] replace
execute if block ~ ~ ~ minecraft:snow[layers=4] run setblock ~ ~ ~ minecraft:snow[layers=5] replace
execute if block ~ ~ ~ minecraft:snow[layers=3] run setblock ~ ~ ~ minecraft:snow[layers=4] replace
execute if block ~ ~ ~ minecraft:snow[layers=2] run setblock ~ ~ ~ minecraft:snow[layers=3] replace
execute if block ~ ~ ~ minecraft:snow[layers=1] run setblock ~ ~ ~ minecraft:snow[layers=2] replace
execute unless block ~ ~ ~ minecraft:snow run setblock ~ ~ ~ minecraft:snow[layers=1]

# Remove the snowflake
kill @s
