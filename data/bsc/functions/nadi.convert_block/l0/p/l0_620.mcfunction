execute if block ~ ~ ~ minecraft:conduit[waterlogged=true] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:conduit",Properties:{waterlogged:true}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:conduit[waterlogged=false] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:conduit",Properties:{waterlogged:false}},Time:1,NoGravity:1b}
