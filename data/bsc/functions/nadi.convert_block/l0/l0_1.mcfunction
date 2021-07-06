execute if block ~ ~ ~ minecraft:grass_block run function bsc:nadi.convert_block/l0/p/l0_8
execute if block ~ ~ ~ minecraft:dirt[] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:dirt",Properties:{}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:coarse_dirt[] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:coarse_dirt",Properties:{}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:podzol run function bsc:nadi.convert_block/l0/p/l0_11
execute if block ~ ~ ~ minecraft:cobblestone[] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:cobblestone",Properties:{}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:oak_planks[] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:oak_planks",Properties:{}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:spruce_planks[] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:spruce_planks",Properties:{}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:birch_planks[] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:birch_planks",Properties:{}},Time:1,NoGravity:1b}
