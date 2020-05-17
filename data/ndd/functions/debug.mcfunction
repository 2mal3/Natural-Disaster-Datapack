# Description: send debug infos
# Called from: #debug
# Datapck by 2mal3

tellraw @a {"text":""}


tellraw @s [{"text":"Natural Disaser Datapack v.","color":"red","bold":true},{"score":{"name":"V1","objective":"ndd.data"},"color":"red"},{"text":".","color":"red"},{"score":{"name":"V2","objective":"ndd.data"},"color":"red"},{"text":".","color":"red"},{"score":{"name":"V3","objective":"ndd.data"},"color":"red"}]

execute store result score @s ndd.data run data get entity @s DataVersion
tellraw @s [{"text":"Data Version: ","color":"aqua"},{"score":{"name":"@s","objective":"ndd.data"},"color":"gold"}]

tellraw @s [{"text":"Fist run: ","color":"aqua"},{"score":{"name":"ndd.first","objective":"ndd.data"},"color":"gold"}]

tellraw @s [{"text":"Natural Disaser is on: ","color":"aqua"},{"score":{"name":"ndd.natural_disaster_on","objective":"ndd.data"},"color":"gold"}]

tellraw @s [{"text":"Last Natural Disaser id: ","color":"aqua"},{"score":{"name":"ndd.disaster","objective":"ndd.data"},"color":"gold"}]

execute if score ndd.natural_disaster_on ndd.data matches 0 run tellraw @s [{"text":"Time until the next natural disaster: ","color":"aqua"},{"score":{"name":"ndd.time","objective":"ndd.data"},"color":"gold"}]
execute if score ndd.natural_disaster_on ndd.data matches 1 run tellraw @s [{"text":"Time until the end of the natural disaster: ","color":"aqua"},{"score":{"name":"ndd.time","objective":"ndd.data"},"color":"gold"}]


tellraw @a {"text":""}
