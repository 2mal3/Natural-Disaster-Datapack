execute if block ~ ~ ~ minecraft:cave_vines_plant[berries=true] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:cave_vines_plant",Properties:{berries:true}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:cave_vines_plant[berries=false] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:cave_vines_plant",Properties:{berries:false}},Time:1,NoGravity:1b}
