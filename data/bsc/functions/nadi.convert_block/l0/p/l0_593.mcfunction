execute if block ~ ~ ~ minecraft:tube_coral[waterlogged=true] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:tube_coral",Properties:{waterlogged:true}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:tube_coral[waterlogged=false] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:tube_coral",Properties:{waterlogged:false}},Time:1,NoGravity:1b}
