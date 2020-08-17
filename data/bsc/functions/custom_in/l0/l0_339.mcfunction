execute if block ~ ~ ~ minecraft:lantern[hanging=true] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:lantern",Properties:{hanging:true}},Time:1}
execute if block ~ ~ ~ minecraft:lantern[hanging=false] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:lantern",Properties:{hanging:false}},Time:1}
execute if block ~ ~ ~ minecraft:soul_lantern[hanging=true] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:soul_lantern",Properties:{hanging:true}},Time:1}
execute if block ~ ~ ~ minecraft:soul_lantern[hanging=false] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:soul_lantern",Properties:{hanging:false}},Time:1}
