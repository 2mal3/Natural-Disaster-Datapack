execute if block ~ ~ ~ minecraft:grass_block[snowy=true] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:grass_block",Properties:{snowy:true}},Time:1}
execute if block ~ ~ ~ minecraft:grass_block[snowy=false] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:grass_block",Properties:{snowy:false}},Time:1}
execute if block ~ ~ ~ minecraft:dirt[] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:dirt",Properties:{}},Time:1}
