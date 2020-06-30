execute if block ~ ~ ~ minecraft:dark_oak_sapling[stage=0] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:dark_oak_sapling",Properties:{stage:0}},NoGravity:1b,Time:1}
execute if block ~ ~ ~ minecraft:dark_oak_sapling[stage=1] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:dark_oak_sapling",Properties:{stage:1}},NoGravity:1b,Time:1}
execute if block ~ ~ ~ minecraft:bedrock[] run summon falling_block ~ ~5 ~ {BlockState:{Name:"minecraft:bedrock",Properties:{}},NoGravity:1b,Time:1}
