# Description: Creat a thunderstorm
# Called from: ndd:choose_disaster
# Datapck by 2mal3

weather thunder 99999
execute if score ndd.notifications_on ndd.config matches 1 run tellraw @a {"text":"A thunderstorm begins.","color":"gray"}

scoreboard players operation ndd.time ndd.data = ndd.thunderstorm_time ndd.config
scoreboard players set ndd.natural_disaster_on ndd.data 1

schedule function ndd.thunderstorm:tick 10s
