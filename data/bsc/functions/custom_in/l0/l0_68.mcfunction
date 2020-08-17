execute if block ~ ~ ~ minecraft:bricks[] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:bricks",Properties:{}},Time:1}
execute if block ~ ~ ~ minecraft:tnt[unstable=true] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:tnt",Properties:{unstable:true}},Time:1}
execute if block ~ ~ ~ minecraft:tnt[unstable=false] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:tnt",Properties:{unstable:false}},Time:1}
