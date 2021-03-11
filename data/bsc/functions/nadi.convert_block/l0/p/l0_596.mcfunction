execute if block ~ ~ ~ minecraft:fire_coral[waterlogged=true] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:fire_coral",Properties:{waterlogged:true}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:fire_coral[waterlogged=false] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:fire_coral",Properties:{waterlogged:false}},Time:1,NoGravity:1b}
