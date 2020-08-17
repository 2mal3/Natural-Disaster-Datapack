execute if block ~ ~ ~ minecraft:dead_horn_coral[waterlogged=true] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:dead_horn_coral",Properties:{waterlogged:true}},Time:1}
execute if block ~ ~ ~ minecraft:dead_horn_coral[waterlogged=false] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:dead_horn_coral",Properties:{waterlogged:false}},Time:1}
execute if block ~ ~ ~ minecraft:tube_coral[waterlogged=true] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:tube_coral",Properties:{waterlogged:true}},Time:1}
execute if block ~ ~ ~ minecraft:tube_coral[waterlogged=false] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:tube_coral",Properties:{waterlogged:false}},Time:1}
