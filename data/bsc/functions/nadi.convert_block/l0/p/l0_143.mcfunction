execute if block ~ ~ ~ minecraft:tnt[unstable=true] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:tnt",Properties:{unstable:true}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:tnt[unstable=false] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:tnt",Properties:{unstable:false}},Time:1,NoGravity:1b}
