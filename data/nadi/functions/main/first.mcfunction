# Description: First datapack run
# Called from: main/realod
# Datapck by 2mal3

# send install message
tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] [{"text":"[Server] Natural Disaster Datapack v.","color":"blue"},{"score":{"name":"$V1","objective":"nadi.data"},"color":"blue"},{"text":".","color":"blue"},{"score":{"name":"$V2","objective":"nadi.data"},"color":"blue"},{"text":".","color":"blue"},{"score":{"name":"$V3","objective":"nadi.data"},"color":"blue"},{"translate":" by 2mal3 was installed!","color":"blue"}]

# init disaster scoreboards
execute store result score $nadi.time nadi.data run loot spawn ~ ~ ~ loot nadi:nadi/random_time
scoreboard players set $nadi.firestorm_on nadi.data 0
scoreboard players set $nadi.first nadi.data 1
scoreboard players set $nadi.natural_disaster_on nadi.data 0

# load  start config
function nadi:main/start_config
