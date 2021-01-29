# Description: The blizzard tick
# Called from: 2mal3:nadi/natural_disasters/blizzard/create, 2mal3:nadi/natural_disasters/blizzard/tick
# Datapack by 2mal3


# blizzard effects for all player not in rooms
tag @a[tag=nadi.blizzard_effect] remove nadi.blizzard_effect
execute as @a[gamemode=!spectator,tag=!global.ignore,tag=!global.ignore.gui] at @s if block ~ ~2 ~ minecraft:air if block ~ ~3 ~ minecraft:air if block ~ ~4 ~ minecraft:air if block ~ ~5 ~ minecraft:air if block ~ ~6 ~ minecraft:air run function 2mal3:nadi/natural_disasters/blizzard/effect


# place random snow around the player and stack it
execute as @e[type=minecraft:item,tag=nadi.snow] at @s unless block ~ ~-1 ~ #2mal3:nadi/blizzard/air if block ~ ~ ~ #2mal3:nadi/blizzard/air run function 2mal3:nadi/natural_disasters/blizzard/place

execute as @e[tag=nadi.blizzard,type=minecraft:area_effect_cloud] at @s run summon minecraft:item ~ ~10 ~ {NoGravity:1b,Motion:[0.0,-0.3,0.0],Tags:["nadi.snow","global.ignore"],Item:{id:"minecraft:snowball",Count:1b}}
kill @e[type=minecraft:area_effect_cloud,tag=nadi.blizzard]


# timer
schedule function 2mal3:nadi/natural_disasters/blizzard/tick 1s

scoreboard players remove $nadi.time nadi.data 1
execute if score $nadi.time nadi.data matches 0 run function 2mal3:nadi/natural_disasters/blizzard/remove
