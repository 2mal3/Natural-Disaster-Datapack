execute if block ~ ~ ~ minecraft:brain_coral[waterlogged=true] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:brain_coral",Properties:{waterlogged:true}},Time:1}
execute if block ~ ~ ~ minecraft:brain_coral[waterlogged=false] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:brain_coral",Properties:{waterlogged:false}},Time:1}
execute if block ~ ~ ~ minecraft:bubble_coral[waterlogged=true] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:bubble_coral",Properties:{waterlogged:true}},Time:1}
execute if block ~ ~ ~ minecraft:bubble_coral[waterlogged=false] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:bubble_coral",Properties:{waterlogged:false}},Time:1}
