execute if block ~ ~ ~ minecraft:dark_oak_sapling[stage=0] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:dark_oak_sapling",Properties:{stage:0}},Time:1}
execute if block ~ ~ ~ minecraft:dark_oak_sapling[stage=1] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:dark_oak_sapling",Properties:{stage:1}},Time:1}
execute if block ~ ~ ~ minecraft:bedrock[] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:bedrock",Properties:{}},Time:1}
