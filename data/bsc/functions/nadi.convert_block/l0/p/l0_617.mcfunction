execute if block ~ ~ ~ minecraft:tube_coral_fan[waterlogged=true] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:tube_coral_fan",Properties:{waterlogged:true}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:tube_coral_fan[waterlogged=false] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:tube_coral_fan",Properties:{waterlogged:false}},Time:1,NoGravity:1b}
