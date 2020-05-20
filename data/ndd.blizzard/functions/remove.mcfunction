# Description: Removes the blizzard
# Called from: ndd.blizzard:tick
# Datapack by 2mal3

execute if score ndd.notifications_on ndd.config matches 1 run tellraw @a {"text":"The blizzard stops.","color":"gray"}
kill @e[type=minecraft:armor_stand,tag=ndd.blizzard]

schedule clear ndd.blizzard:tick
scoreboard players set ndd.blizzard_on ndd.data 0
function ndd:new_time
scoreboard players set ndd.natural_disaster_on ndd.data 0
