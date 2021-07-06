execute if block ~ ~ ~ minecraft:bubble_column[drag=true] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:bubble_column",Properties:{drag:true}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:bubble_column[drag=false] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:bubble_column",Properties:{drag:false}},Time:1,NoGravity:1b}
