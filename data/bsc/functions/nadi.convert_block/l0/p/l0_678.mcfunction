execute if block ~ ~ ~ minecraft:lantern[hanging=true] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:lantern",Properties:{hanging:true}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:lantern[hanging=false] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:lantern",Properties:{hanging:false}},Time:1,NoGravity:1b}
