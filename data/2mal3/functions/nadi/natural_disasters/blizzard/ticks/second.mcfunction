# Description: The main loop of the blzzard every second
# Called from functions: 2mal3:nadi/natural_disasters/blizzard/create, 2mal3:nadi/natural_disasters/blizzard/ticks/second
# Datapack by 2mal3

# Performs all kinds of things for players who are under the free sky
execute as @a[tag=!global.ignore,predicate=2mal3:nadi/in_overworld,gamemode=!spectator] at @s if block ~ ~2 ~ minecraft:air if block ~ ~3 ~ minecraft:air if block ~ ~4 ~ minecraft:air if block ~ ~5 ~ minecraft:air if block ~ ~6 ~ minecraft:air run function 2mal3:nadi/natural_disasters/blizzard/effect

# Creates a snowflake above each anchor
execute as @e[type=minecraft:area_effect_cloud,tag=nadi.anchor] at @s run summon minecraft:item ~ ~10 ~ {NoGravity:1b,Motion:[0.0,-0.3,0.0],Tags:["nadi.snow","global.ignore"],Item:{id:"minecraft:snowball",Count:1b}}

# Placed snow on the ground where snowflakes lie  
execute as @e[type=minecraft:item,tag=nadi.snow] at @s unless block ~ ~-1 ~ #2mal3:nadi/blizzard/air if block ~ ~ ~ #2mal3:nadi/blizzard/air run function 2mal3:nadi/natural_disasters/blizzard/place

# Calls this function again in one second
schedule function 2mal3:nadi/natural_disasters/blizzard/ticks/second 1s
