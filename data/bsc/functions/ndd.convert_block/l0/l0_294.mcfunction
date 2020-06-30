execute if block ~ ~ ~ minecraft:fire_coral[waterlogged=true] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:fire_coral",Properties:{waterlogged:true}},NoGravity:1b,Time:1}
execute if block ~ ~ ~ minecraft:fire_coral[waterlogged=false] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:fire_coral",Properties:{waterlogged:false}},NoGravity:1b,Time:1}
execute if block ~ ~ ~ minecraft:horn_coral[waterlogged=true] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:horn_coral",Properties:{waterlogged:true}},NoGravity:1b,Time:1}
execute if block ~ ~ ~ minecraft:horn_coral[waterlogged=false] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:horn_coral",Properties:{waterlogged:false}},NoGravity:1b,Time:1}
