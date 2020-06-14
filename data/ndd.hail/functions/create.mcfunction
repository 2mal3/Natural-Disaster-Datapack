# Description: Creat a hail
# Called from: ndd:choose_disaster
# Datapck by 2mal3

weather rain 99999
execute if score ndd.notifications_on ndd.config matches 1 run tellraw @a {"translate":"A hail begins.","color":"gray"}

scoreboard players operation ndd.time ndd.data = ndd.hail_time ndd.config
scoreboard players set ndd.natural_disaster_on ndd.data 1
function #ndd_api:hail_time

schedule function ndd.hail:tick 5s
