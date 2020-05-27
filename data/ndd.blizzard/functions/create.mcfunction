# Description: Creat a blizzard
# Called from: ndd:choose_disaster
# Datapack by 2mal3

execute if score ndd.notifications_on ndd.config matches 1 run tellraw @a {"translate":"A blizzard begins.","color":"gray"}

scoreboard players operation ndd.time ndd.data = ndd.blizzard_time ndd.config
scoreboard players set ndd.natural_disaster_on ndd.data 1
scoreboard players set ndd.blizzard_on ndd.data 1

schedule function ndd.blizzard:tick 4s
