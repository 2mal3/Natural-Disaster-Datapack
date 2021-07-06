execute if block ~ ~ ~ minecraft:candle_cake[lit=true] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:candle_cake",Properties:{lit:true}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:candle_cake[lit=false] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:candle_cake",Properties:{lit:false}},Time:1,NoGravity:1b}
