execute if block ~ ~ ~ minecraft:redstone_ore[lit=true] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:redstone_ore",Properties:{lit:true}},NoGravity:1b,Time:1}
execute if block ~ ~ ~ minecraft:redstone_ore[lit=false] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:redstone_ore",Properties:{lit:false}},NoGravity:1b,Time:1}
execute if block ~ ~ ~ minecraft:redstone_torch[lit=true] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:redstone_torch",Properties:{lit:true}},NoGravity:1b,Time:1}
execute if block ~ ~ ~ minecraft:redstone_torch[lit=false] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:redstone_torch",Properties:{lit:false}},NoGravity:1b,Time:1}
