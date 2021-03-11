execute if block ~ ~ ~ minecraft:mycelium[snowy=true] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:mycelium",Properties:{snowy:true}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:mycelium[snowy=false] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:mycelium",Properties:{snowy:false}},Time:1,NoGravity:1b}
