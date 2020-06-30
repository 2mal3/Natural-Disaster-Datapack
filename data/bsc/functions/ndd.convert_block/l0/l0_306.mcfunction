execute if block ~ ~ ~ minecraft:conduit[waterlogged=true] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:conduit",Properties:{waterlogged:true}},NoGravity:1b,Time:1}
execute if block ~ ~ ~ minecraft:conduit[waterlogged=false] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:conduit",Properties:{waterlogged:false}},NoGravity:1b,Time:1}
execute if block ~ ~ ~ minecraft:bamboo_sapling[] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:bamboo_sapling",Properties:{}},NoGravity:1b,Time:1}
