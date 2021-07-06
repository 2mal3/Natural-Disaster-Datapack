execute if block ~ ~ ~ minecraft:heavy_weighted_pressure_plate run function bsc:nadi.convert_block/l0/p/l0_344
execute if block ~ ~ ~ minecraft:comparator run function bsc:nadi.convert_block/l0/p/l0_345
execute if block ~ ~ ~ minecraft:daylight_detector run function bsc:nadi.convert_block/l0/p/l0_346
execute if block ~ ~ ~ minecraft:redstone_block[] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:redstone_block",Properties:{}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:nether_quartz_ore[] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:nether_quartz_ore",Properties:{}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:hopper run function bsc:nadi.convert_block/l0/p/l0_349
execute if block ~ ~ ~ minecraft:quartz_block[] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:quartz_block",Properties:{}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:chiseled_quartz_block[] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:chiseled_quartz_block",Properties:{}},Time:1,NoGravity:1b}
