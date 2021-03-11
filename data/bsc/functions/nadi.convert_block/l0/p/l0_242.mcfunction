execute if block ~ ~ ~ minecraft:chain[waterlogged=true] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:chain",Properties:{waterlogged:true}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:chain[waterlogged=false] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:chain",Properties:{waterlogged:false}},Time:1,NoGravity:1b}
