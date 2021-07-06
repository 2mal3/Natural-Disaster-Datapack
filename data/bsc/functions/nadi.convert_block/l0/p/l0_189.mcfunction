execute if block ~ ~ ~ minecraft:redstone_torch[lit=true] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:redstone_torch",Properties:{lit:true}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:redstone_torch[lit=false] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:redstone_torch",Properties:{lit:false}},Time:1,NoGravity:1b}
