execute if block ~ ~ ~ minecraft:hanging_roots[waterlogged=true] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:hanging_roots",Properties:{waterlogged:true}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:hanging_roots[waterlogged=false] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:hanging_roots",Properties:{waterlogged:false}},Time:1,NoGravity:1b}
