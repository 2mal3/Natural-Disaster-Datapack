execute if block ~ ~ ~ minecraft:dead_fire_coral[waterlogged=true] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:dead_fire_coral",Properties:{waterlogged:true}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:dead_fire_coral[waterlogged=false] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:dead_fire_coral",Properties:{waterlogged:false}},Time:1,NoGravity:1b}
