execute if block ~ ~ ~ minecraft:grass_block[snowy=true] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:grass_block",Properties:{snowy:true}},NoGravity:1b,Time:1}
execute if block ~ ~ ~ minecraft:grass_block[snowy=false] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:grass_block",Properties:{snowy:false}},NoGravity:1b,Time:1}
execute if block ~ ~ ~ minecraft:dirt[] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:dirt",Properties:{}},NoGravity:1b,Time:1}
