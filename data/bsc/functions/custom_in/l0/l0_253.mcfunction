execute if block ~ ~ ~ minecraft:bone_block[axis=x] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:bone_block",Properties:{axis:x}},Time:1}
execute if block ~ ~ ~ minecraft:bone_block[axis=y] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:bone_block",Properties:{axis:y}},Time:1}
execute if block ~ ~ ~ minecraft:bone_block[axis=z] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:bone_block",Properties:{axis:z}},Time:1}
execute if block ~ ~ ~ minecraft:structure_void[] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:structure_void",Properties:{}},Time:1}
