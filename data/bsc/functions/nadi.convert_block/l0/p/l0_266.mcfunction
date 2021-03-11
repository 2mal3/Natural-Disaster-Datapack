execute if block ~ ~ ~ minecraft:redstone_lamp[lit=true] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:redstone_lamp",Properties:{lit:true}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:redstone_lamp[lit=false] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:redstone_lamp",Properties:{lit:false}},Time:1,NoGravity:1b}
