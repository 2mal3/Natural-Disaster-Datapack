execute if block ~ ~ ~ minecraft:polished_blackstone_pressure_plate[powered=true] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:polished_blackstone_pressure_plate",Properties:{powered:true}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:polished_blackstone_pressure_plate[powered=false] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:polished_blackstone_pressure_plate",Properties:{powered:false}},Time:1,NoGravity:1b}