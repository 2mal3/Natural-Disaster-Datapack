# Description: Creat a thunderstorm
# Called from: ndd:choose_disaster
# Datapck by 2mal3

execute if score ndd.notifications_on ndd.config matches 1 run tellraw @a {"translate":"A thunderstorm begins.","color":"gray"}


weather thunder 99999


scoreboard players operation ndd.time ndd.data = ndd.thunderstorm_time ndd.config
scoreboard players set ndd.natural_disaster_on ndd.data 1
function #ndd_api:thunderstorm_time

schedule function ndd.thunderstorm:tick 10s
