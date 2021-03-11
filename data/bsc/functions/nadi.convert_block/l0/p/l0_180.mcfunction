execute if block ~ ~ ~ minecraft:redstone_ore[lit=true] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:redstone_ore",Properties:{lit:true}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:redstone_ore[lit=false] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:redstone_ore",Properties:{lit:false}},Time:1,NoGravity:1b}
