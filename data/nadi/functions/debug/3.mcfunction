# Description: send debug infos
# Called from: nadi:debug/2
# Datapack by 2mal3

tellraw @s {"text":""}

# Datapack version and name
tellraw @s [{"text":"Natural Disaser Datapack v.","color":"red","bold":true},{"score":{"name":"$V1","objective":"nadi.data"},"color":"red"},{"text":".","color":"red"},{"score":{"name":"$V2","objective":"nadi.data"},"color":"red"},{"text":".","color":"red"},{"score":{"name":"$V3","objective":"nadi.data"},"color":"red"}]

# minecraft version
tellraw @s [{"text":"Data version: ","color":"aqua"},{"score":{"name":"$nadi.temp_0","objective":"nadi.data"},"color":"gold"}]

# du version
tellraw @s [{"text":"Datapack Utils version: ","color":"aqua"},{"score":{"name":"$du.ver","objective":"load"},"color":"gold"}]

# first datapack run was
tellraw @s [{"text":"Fist run: ","color":"aqua"},{"score":{"name":"$nadi.first","objective":"nadi.data"},"color":"gold"}]

# current is a natural diasaster
tellraw @s [{"text":"Natural disaser is on: ","color":"aqua"},{"score":{"name":"$nadi.natural_disaster_on","objective":"nadi.data"},"color":"gold"}]

# id from the current or last natural disaster
tellraw @s [{"text":"Last natural nisaser id: ","color":"aqua"},{"score":{"name":"$nadi.disaster","objective":"nadi.data"},"color":"gold"}]

# time befor the natural disaster stop or begins
execute if score $nadi.natural_disaster_on nadi.data matches 0 run tellraw @s [{"text":"Time until the next natural disaster: ","color":"aqua"},{"score":{"name":"$nadi.time","objective":"nadi.data"},"color":"gold"}]
execute if score $nadi.natural_disaster_on nadi.data matches 1 run tellraw @s [{"text":"Time until the end of the natural disaster: ","color":"aqua"},{"score":{"name":"$nadi.time","objective":"nadi.data"},"color":"gold"}]

# ticks the time
execute unless score $nadi.temp_1 nadi.data = $nadi.time nadi.data run tellraw @s [{"text":"Is ticking: ","color":"aqua"},{"text":"1","color":"gold"}]
execute if score $nadi.temp_1 nadi.data = $nadi.time nadi.data run tellraw @s [{"text":"Is ticking: ","color":"aqua"},{"text":"0","color":"gold"}]

tellraw @s {"text":""}


tag @s remove nadi.debug
