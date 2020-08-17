execute if block ~ ~ ~ minecraft:dead_tube_coral[waterlogged=true] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:dead_tube_coral",Properties:{waterlogged:true}},Time:1}
execute if block ~ ~ ~ minecraft:dead_tube_coral[waterlogged=false] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:dead_tube_coral",Properties:{waterlogged:false}},Time:1}
execute if block ~ ~ ~ minecraft:dead_brain_coral[waterlogged=true] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:dead_brain_coral",Properties:{waterlogged:true}},Time:1}
execute if block ~ ~ ~ minecraft:dead_brain_coral[waterlogged=false] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:dead_brain_coral",Properties:{waterlogged:false}},Time:1}
