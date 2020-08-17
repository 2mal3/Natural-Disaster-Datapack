execute if block ~ ~ ~ minecraft:seagrass[] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:seagrass",Properties:{}},Time:1}
execute if block ~ ~ ~ minecraft:tall_seagrass[half=upper] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:tall_seagrass",Properties:{half:upper}},Time:1}
execute if block ~ ~ ~ minecraft:tall_seagrass[half=lower] run summon falling_block ~ ~5 ~ {NoGravity:1b,BlockState:{Name:"minecraft:tall_seagrass",Properties:{half:lower}},Time:1}
