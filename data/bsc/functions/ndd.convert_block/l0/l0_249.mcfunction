execute if block ~ ~ ~ minecraft:bone_block[axis=x] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:bone_block",Properties:{axis:x}},NoGravity:1b,Time:1}
execute if block ~ ~ ~ minecraft:bone_block[axis=y] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:bone_block",Properties:{axis:y}},NoGravity:1b,Time:1}
execute if block ~ ~ ~ minecraft:bone_block[axis=z] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:bone_block",Properties:{axis:z}},NoGravity:1b,Time:1}
execute if block ~ ~ ~ minecraft:structure_void[] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:structure_void",Properties:{}},NoGravity:1b,Time:1}
