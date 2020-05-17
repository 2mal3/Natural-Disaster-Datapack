# Description: Removes the thunderstorm
# Called from: ndd.thunderstorm:tick
# Datapck by 2mal3

execute if score ndd.notifications_on ndd.config matches 1 run tellraw @a {"text":"The thunderstorm stops.","color":"gray"}

schedule clear ndd.thunderstorm:tick
weather clear
function ndd:new_time
scoreboard players set ndd.natural_disaster_on ndd.data 0
