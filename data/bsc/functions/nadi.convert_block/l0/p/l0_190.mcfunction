execute if block ~ ~ ~ minecraft:jukebox[has_record=true] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:jukebox",Properties:{has_record:true}},Time:1,NoGravity:1b}
execute if block ~ ~ ~ minecraft:jukebox[has_record=false] run summon falling_block ~ ~ ~ {BlockState:{Name:"minecraft:jukebox",Properties:{has_record:false}},Time:1,NoGravity:1b}
