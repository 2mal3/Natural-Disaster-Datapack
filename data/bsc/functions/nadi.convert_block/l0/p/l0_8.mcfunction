execute if block ~ ~ ~ minecraft:grass_block[snowy=true] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:grass_block",Properties:{snowy:true}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:grass_block[snowy=false] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:grass_block",Properties:{snowy:false}},Time:1,NoGravity:1b}
