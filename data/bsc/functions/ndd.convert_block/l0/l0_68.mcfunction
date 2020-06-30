execute if block ~ ~ ~ minecraft:tnt[unstable=true] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:tnt",Properties:{unstable:true}},NoGravity:1b,Time:1}
execute if block ~ ~ ~ minecraft:tnt[unstable=false] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:tnt",Properties:{unstable:false}},NoGravity:1b,Time:1}
execute if block ~ ~ ~ minecraft:bookshelf[] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:bookshelf",Properties:{}},NoGravity:1b,Time:1}
