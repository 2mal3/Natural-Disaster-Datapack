# Description: Removes the sandstorm
# Called from: ndd.sandstorm:tick
# Datapack by 2mal3

execute if score ndd.notifications_on ndd.config matches 1 run tellraw @a {"translate":"The sandstorm stops.","color":"gray"}

schedule clear ndd.sandstorm:tick
scoreboard players set ndd.sandstorm_on ndd.data 0
function ndd:new_time
scoreboard players set ndd.natural_disaster_on ndd.data 0
