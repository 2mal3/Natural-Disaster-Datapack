# Description: Removes the firestorm
# Called from: ndd.firestorm:tick
# Datapck by 2mal3

execute if score ndd.notifications_on ndd.config matches 1 run tellraw @a {"translate":"The firestorm stops.","color":"gray"}

schedule clear ndd.firestorm:tick
scoreboard players set ndd.firestorm_on ndd.data 0
tp @e[tag=ndd.firestorm.s] ~ -1000 ~
function ndd:new_time
scoreboard players set ndd.natural_disaster_on ndd.data 0
