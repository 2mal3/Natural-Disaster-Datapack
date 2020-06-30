# Description: Removes the hurricane
# Called from: ndd.hurricane:tick
# Datapck by 2mal3

execute if score ndd.notifications_on ndd.config matches 1 run tellraw @a {"translate":"The hurricane stops.","color":"gray"}
execute as @e[type=minecraft:armor_stand,tag=ndd.hurricane.1] at @s run kill @e[type=minecraft:falling_block,distance=..100]

schedule clear ndd.hurricane:tick
tp @e[type=minecraft:armor_stand,tag=ndd.hurricane.1] ~ -1000 ~
tp @e[type=minecraft:pig,tag=ndd.hurricane.2] ~ -1000 ~
weather clear

function ndd:new_time
scoreboard players set ndd.natural_disaster_on ndd.data 0
