# Description: send debug infos
# Called from: ndd:debug/2
# Datapack by 2mal3

tellraw @s {"text":""}

# Datapack version and name
tellraw @s [{"text":"Natural Disaser Datapack v.","color":"red","bold":true},{"score":{"name":"V1","objective":"ndd.data"},"color":"red"},{"text":".","color":"red"},{"score":{"name":"V2","objective":"ndd.data"},"color":"red"},{"text":".","color":"red"},{"score":{"name":"V3","objective":"ndd.data"},"color":"red"}]

# minecraft version
tellraw @s [{"text":"Data version: ","color":"aqua"},{"score":{"name":"ndd.temp_0","objective":"ndd.data"},"color":"gold"}]

# du version
tellraw @s [{"text":"Datapack Utils version: ","color":"aqua"},{"score":{"name":"$du.ver","objective":"load"},"color":"gold"}]

# first datapack run was
tellraw @s [{"text":"Fist run: ","color":"aqua"},{"score":{"name":"ndd.first","objective":"ndd.data"},"color":"gold"}]

# current is a natural diasaster
tellraw @s [{"text":"Natural disaser is on: ","color":"aqua"},{"score":{"name":"ndd.natural_disaster_on","objective":"ndd.data"},"color":"gold"}]

# id from the current or last natural disaster
tellraw @s [{"text":"Last natural nisaser id: ","color":"aqua"},{"score":{"name":"ndd.disaster","objective":"ndd.data"},"color":"gold"}]

# time befor the natural disaster stop or begins
execute if score ndd.natural_disaster_on ndd.data matches 0 run tellraw @s [{"text":"Time until the next natural disaster: ","color":"aqua"},{"score":{"name":"ndd.time","objective":"ndd.data"},"color":"gold"}]
execute if score ndd.natural_disaster_on ndd.data matches 1 run tellraw @s [{"text":"Time until the end of the natural disaster: ","color":"aqua"},{"score":{"name":"ndd.time","objective":"ndd.data"},"color":"gold"}]

# ticks the time
execute unless score ndd.temp_1 ndd.data = ndd.time ndd.data run tellraw @s [{"text":"Is ticking: ","color":"aqua"},{"text":"1","color":"gold"}]
execute if score ndd.temp_1 ndd.data = ndd.time ndd.data run tellraw @s [{"text":"Is ticking: ","color":"aqua"},{"text":"0","color":"gold"}]

tellraw @s {"text":""}


tag @s remove ndd.debug
scoreboard players reset ndd.debug ndd.data
