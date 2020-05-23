# Description: Creat a sandstorm
# Called from: ndd:choose_disaster
# Datapack by 2mal3

execute if score ndd.notifications_on ndd.config matches 1 run tellraw @a {"text":"A sandstorm begins.","color":"gray"}

scoreboard players operation ndd.time ndd.data = ndd.sandstorm_time ndd.config
scoreboard players set ndd.natural_disaster_on ndd.data 1
scoreboard players set ndd.sandstorm_on ndd.data 1

schedule function ndd.sandstorm:tick 4s
