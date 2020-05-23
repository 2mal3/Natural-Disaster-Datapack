# Description: The blizzard tick
# Called from: ndd.blizzard:create, ndd.blizzard:tick
# Datapack by 2mal3


# blizzard effects
execute as @a[gamemode=!spectator] at @s if block ~ ~2 ~ minecraft:air if block ~ ~3 ~ minecraft:air if block ~ ~4 ~ minecraft:air if block ~ ~5 ~ minecraft:air if block ~ ~6 ~ minecraft:air run function ndd.blizzard:effect


# place random snow around the player and stack it
execute as @e[type=minecraft:item,tag=ndd.snow] at @s unless block ~ ~-1 ~ minecraft:air run function ndd.blizzard:place

execute as @a[gamemode=!spectator] at @s run function ndd.blizzard:summon
execute as @a[gamemode=!spectator] at @s run spreadplayers ~ ~ 2 7 false @e[sort=nearest,limit=5,tag=ndd.blizzard]

execute as @e[type=minecraft:armor_stand,tag=ndd.blizzard] at @s run summon minecraft:item ~ ~10 ~ {NoGravity:1b,Motion:[0.0,-0.3,0.0],Tags:["ndd.snow"],Item:{id:"minecraft:snowball",Count:1b}}
kill @e[type=minecraft:armor_stand,tag=ndd.blizzard]


# timer
schedule function ndd.blizzard:tick 1s

scoreboard players remove ndd.time ndd.data 1
execute if score ndd.time ndd.data matches 0 run function ndd.blizzard:remove
