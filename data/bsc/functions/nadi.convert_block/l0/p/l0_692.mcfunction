execute if block ~ ~ ~ minecraft:lantern[hanging=true,waterlogged=true] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:lantern",Properties:{hanging:true,waterlogged:true}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:lantern[hanging=true,waterlogged=false] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:lantern",Properties:{hanging:true,waterlogged:false}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:lantern[hanging=false,waterlogged=true] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:lantern",Properties:{hanging:false,waterlogged:true}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:lantern[hanging=false,waterlogged=false] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:lantern",Properties:{hanging:false,waterlogged:false}},Time:1,NoGravity:1b}
