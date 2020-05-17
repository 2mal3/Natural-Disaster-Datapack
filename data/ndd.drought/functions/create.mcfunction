# Description: Creat a drought
# Called from: ndd:choose_disaster
# Datapck by 2mal3

execute if score ndd.notifications_on ndd.config matches 1 run tellraw @a {"text":"A drought begins.","color":"gray"}

scoreboard players operation ndd.time ndd.data = ndd.drought_time ndd.config
scoreboard players set ndd.natural_disaster_on ndd.data 1

schedule function ndd.drought:tick 5s
