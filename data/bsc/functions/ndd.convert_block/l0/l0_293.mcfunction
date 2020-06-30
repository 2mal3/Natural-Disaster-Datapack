execute if block ~ ~ ~ minecraft:brain_coral[waterlogged=true] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:brain_coral",Properties:{waterlogged:true}},NoGravity:1b,Time:1}
execute if block ~ ~ ~ minecraft:brain_coral[waterlogged=false] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:brain_coral",Properties:{waterlogged:false}},NoGravity:1b,Time:1}
execute if block ~ ~ ~ minecraft:bubble_coral[waterlogged=true] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:bubble_coral",Properties:{waterlogged:true}},NoGravity:1b,Time:1}
execute if block ~ ~ ~ minecraft:bubble_coral[waterlogged=false] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:bubble_coral",Properties:{waterlogged:false}},NoGravity:1b,Time:1}
