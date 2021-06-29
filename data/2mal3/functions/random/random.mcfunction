# Description: Generates a random number
# Called by: ...
# Datapack library by 2mal3

# prepare
forceload add 0 0
summon minecraft:marker 0 0 0 {Tags: ["2mal3.random"]}


# generate .out_0 = .in_0+(rand%(.in_1+1)-.in_0)
execute store result score .temp_0 2mal3.random run data get entity @e[type=minecraft:marker,tag=2mal3.random,limit=1] UUID[0]

scoreboard players operation .temp_1 2mal3.random = .in_1 2mal3.random
scoreboard players add .temp_1 2mal3.random 1
scoreboard players operation .temp_1 2mal3.random -= .in_0 2mal3.random

scoreboard players operation .temp_0 2mal3.random %= .temp_1 2mal3.random
scoreboard players operation .temp_0 2mal3.random += .in_0 2mal3.random

scoreboard players operation .out_0 2mal3.random = .temp_0 2mal3.random


# remove
kill @e[type=minecraft:marker,tag=2mal3.random]
forceload remove 0 0
