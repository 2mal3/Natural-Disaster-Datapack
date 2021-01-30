# Description: Generates a random number
# Called by: ...
# Datapack library by 2mal3

# prepare
forceload add 0 0
summon area_effect_cloud 0 0 0 {Tags:["2mal3.random"]}


# generate
execute store result score $2mal3.random.temp_0 2mal3.random run data get entity @e[type=minecraft:area_effect_cloud,tag=2mal3.random,limit=1] UUID[0]
execute store result score $2mal3.random.temp_1 2mal3.random run data get entity @e[type=minecraft:area_effect_cloud,tag=2mal3.random,limit=1] UUID[1]
scoreboard players operation $2mal3.random.temp_0 2mal3.random *= $2mal3.random.temp_1 2mal3.random

scoreboard players operation $2mal3.random.temp_1 2mal3.random = $2mal3.random.in_1 2mal3.random
scoreboard players operation $2mal3.random.temp_1 2mal3.random -= $2mal3.random.in_0 2mal3.random

scoreboard players operation $2mal3.random.temp_0 2mal3.random %= $2mal3.random.temp_1 2mal3.random
scoreboard players operation $2mal3.random.temp_0 2mal3.random += $2mal3.random.in_0 2mal3.random

scoreboard players operation $2mal3.random.out_0 2mal3.random = $2mal3.random.temp_0 2mal3.random


# remve
kill @e[type=minecraft:area_effect_cloud,tag=2mal3.random]
forceload remove 0 0