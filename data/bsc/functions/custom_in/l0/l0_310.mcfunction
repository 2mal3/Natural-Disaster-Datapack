execute if block ~ ~ ~ minecraft:conduit[waterlogged=true] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:conduit",Properties:{waterlogged:true}},Time:1}
execute if block ~ ~ ~ minecraft:conduit[waterlogged=false] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:conduit",Properties:{waterlogged:false}},Time:1}
execute if block ~ ~ ~ minecraft:bamboo_sapling[] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:bamboo_sapling",Properties:{}},Time:1}
