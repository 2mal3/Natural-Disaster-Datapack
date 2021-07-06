execute if block ~ ~ ~ minecraft:bubble_coral_fan[waterlogged=true] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:bubble_coral_fan",Properties:{waterlogged:true}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:bubble_coral_fan[waterlogged=false] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:bubble_coral_fan",Properties:{waterlogged:false}},Time:1,NoGravity:1b}
