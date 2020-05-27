# Description: Removes the drought
# Called from: ndd.drought:tick
# Datapck by 2mal3

execute if score ndd.notifications_on ndd.config matches 1 run tellraw @a {"translate":"The drought stops.","color":"gray"}

schedule clear ndd.drought:tick
function ndd:new_time
scoreboard players set ndd.natural_disaster_on ndd.data 0
