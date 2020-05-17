# Description: Removes the hurricane
# Called from: ndd.hurricane:tick
# Datapck by 2mal3

execute if score ndd.notifications_on ndd.config matches 1 run tellraw @a {"text":"The hurricane stops.","color":"gray"}

schedule clear ndd.hurricane:tick
tp @e[tag=ndd.hurricane,type=minecraft:armor_stand] ~ -1000 ~
weather clear

function ndd:new_time
scoreboard players set ndd.natural_disaster_on ndd.data 0
