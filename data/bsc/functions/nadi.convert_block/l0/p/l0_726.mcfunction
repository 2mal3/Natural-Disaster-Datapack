execute if block ~ ~ ~ minecraft:structure_block[mode=save] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:structure_block",Properties:{mode:save}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:structure_block[mode=load] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:structure_block",Properties:{mode:load}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:structure_block[mode=corner] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:structure_block",Properties:{mode:corner}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:structure_block[mode=data] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:structure_block",Properties:{mode:data}},Time:1,NoGravity:1b}
