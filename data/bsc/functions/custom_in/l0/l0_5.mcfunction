execute if block ~ ~ ~ minecraft:coarse_dirt[] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:coarse_dirt",Properties:{}},Time:1}
execute if block ~ ~ ~ minecraft:podzol[snowy=true] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:podzol",Properties:{snowy:true}},Time:1}
execute if block ~ ~ ~ minecraft:podzol[snowy=false] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:podzol",Properties:{snowy:false}},Time:1}
