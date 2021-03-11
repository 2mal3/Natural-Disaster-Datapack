execute if block ~ ~ ~ minecraft:podzol[snowy=true] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:podzol",Properties:{snowy:true}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:podzol[snowy=false] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:podzol",Properties:{snowy:false}},Time:1,NoGravity:1b}
