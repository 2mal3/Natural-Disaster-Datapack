execute if block ~ ~ ~ minecraft:black_bed run function bsc:nadi.convert_block/l0/p/l0_96
execute if block ~ ~ ~ minecraft:powered_rail run function bsc:nadi.convert_block/l0/p/l0_97
execute if block ~ ~ ~ minecraft:detector_rail run function bsc:nadi.convert_block/l0/p/l0_98
execute if block ~ ~ ~ minecraft:sticky_piston run function bsc:nadi.convert_block/l0/p/l0_99
execute if block ~ ~ ~ minecraft:cobweb[] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:cobweb",Properties:{}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:grass[] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:grass",Properties:{}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:fern[] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:fern",Properties:{}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:dead_bush[] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:dead_bush",Properties:{}},Time:1,NoGravity:1b}
