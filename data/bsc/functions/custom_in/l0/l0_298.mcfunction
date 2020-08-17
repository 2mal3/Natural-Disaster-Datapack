execute if block ~ ~ ~ minecraft:fire_coral[waterlogged=true] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:fire_coral",Properties:{waterlogged:true}},Time:1}
execute if block ~ ~ ~ minecraft:fire_coral[waterlogged=false] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:fire_coral",Properties:{waterlogged:false}},Time:1}
execute if block ~ ~ ~ minecraft:horn_coral[waterlogged=true] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:horn_coral",Properties:{waterlogged:true}},Time:1}
execute if block ~ ~ ~ minecraft:horn_coral[waterlogged=false] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:horn_coral",Properties:{waterlogged:false}},Time:1}
