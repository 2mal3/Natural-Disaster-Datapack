execute if block ~ ~ ~ minecraft:soul_lantern[hanging=true] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:soul_lantern",Properties:{hanging:true}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:soul_lantern[hanging=false] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:soul_lantern",Properties:{hanging:false}},Time:1,NoGravity:1b}
