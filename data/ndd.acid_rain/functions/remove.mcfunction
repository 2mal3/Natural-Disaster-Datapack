# Description: Removes the acid_rain
# Called from: ndd.acid_rain:tick
# Datapck by 2mal3

weather clear
execute if score ndd.notifications_on ndd.config matches 1 run tellraw @a {"text":"The acid rain stops.","color":"gray"}

schedule clear ndd.acid_rain:tick
function ndd:new_time
scoreboard players set ndd.natural_disaster_on ndd.data 0
