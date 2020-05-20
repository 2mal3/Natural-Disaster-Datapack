# Description: The blizzard tick
# Called from: ndd.blizzard:create, ndd.blizzard:tick
# Datapack by 2mal3


# blizzard effects
effect give @a[gamemode=!spectator] minecraft:blindness 5 0 true
effect give @a[gamemode=!spectator] minecraft:slowness 5 1 true


# place random snow around the player and stack it
execute as @e[type=minecraft:armor_stand,tag=ndd.blizzard] at @s if block ~ ~ ~ minecraft:snow[layers=7] run setblock ~ ~ ~ minecraft:snow[layers=8] replace
execute as @e[type=minecraft:armor_stand,tag=ndd.blizzard] at @s if block ~ ~ ~ minecraft:snow[layers=6] run setblock ~ ~ ~ minecraft:snow[layers=7] replace
execute as @e[type=minecraft:armor_stand,tag=ndd.blizzard] at @s if block ~ ~ ~ minecraft:snow[layers=5] run setblock ~ ~ ~ minecraft:snow[layers=6] replace
execute as @e[type=minecraft:armor_stand,tag=ndd.blizzard] at @s if block ~ ~ ~ minecraft:snow[layers=4] run setblock ~ ~ ~ minecraft:snow[layers=5] replace
execute as @e[type=minecraft:armor_stand,tag=ndd.blizzard] at @s if block ~ ~ ~ minecraft:snow[layers=3] run setblock ~ ~ ~ minecraft:snow[layers=4] replace
execute as @e[type=minecraft:armor_stand,tag=ndd.blizzard] at @s if block ~ ~ ~ minecraft:snow[layers=2] run setblock ~ ~ ~ minecraft:snow[layers=3] replace
execute as @e[type=minecraft:armor_stand,tag=ndd.blizzard] at @s if block ~ ~ ~ minecraft:snow[layers=1] run setblock ~ ~ ~ minecraft:snow[layers=2] replace
execute as @e[type=minecraft:armor_stand,tag=ndd.blizzard] at @s unless block ~ ~ ~ minecraft:snow run setblock ~ ~ ~ minecraft:snow[layers=1]

kill @e[type=minecraft:armor_stand,tag=ndd.blizzard]

execute as @a[gamemode=!spectator] at @s run summon minecraft:armor_stand ~ ~ ~ {Invulnerable:1b,NoBasePlate:1b,Invisible:1b,PersistenceRequired:1b,Tags:["ndd.blizzard"]}
execute as @a[gamemode=!spectator] at @s run summon minecraft:armor_stand ~ ~ ~ {Invulnerable:1b,NoBasePlate:1b,Invisible:1b,PersistenceRequired:1b,Tags:["ndd.blizzard"]}
execute as @a[gamemode=!spectator] at @s run summon minecraft:armor_stand ~ ~ ~ {Invulnerable:1b,NoBasePlate:1b,Invisible:1b,PersistenceRequired:1b,Tags:["ndd.blizzard"]}
execute as @a[gamemode=!spectator] at @s run summon minecraft:armor_stand ~ ~ ~ {Invulnerable:1b,NoBasePlate:1b,Invisible:1b,PersistenceRequired:1b,Tags:["ndd.blizzard"]}
execute as @a[gamemode=!spectator] at @s run summon minecraft:armor_stand ~ ~ ~ {Invulnerable:1b,NoBasePlate:1b,Invisible:1b,PersistenceRequired:1b,Tags:["ndd.blizzard"]}
execute as @a[gamemode=!spectator] at @s run summon minecraft:armor_stand ~ ~ ~ {Invulnerable:1b,NoBasePlate:1b,Invisible:1b,PersistenceRequired:1b,Tags:["ndd.blizzard"]}
execute as @a[gamemode=!spectator] at @s run summon minecraft:armor_stand ~ ~ ~ {Invulnerable:1b,NoBasePlate:1b,Invisible:1b,PersistenceRequired:1b,Tags:["ndd.blizzard"]}
execute as @a[gamemode=!spectator] at @s run summon minecraft:armor_stand ~ ~ ~ {Invulnerable:1b,NoBasePlate:1b,Invisible:1b,PersistenceRequired:1b,Tags:["ndd.blizzard"]}

execute as @a[gamemode=!spectator] at @s run spreadplayers ~ ~ 2 7 false @e[sort=nearest,limit=8,tag=ndd.blizzard]


# timer
schedule function ndd.blizzard:tick 1s

scoreboard players remove ndd.time ndd.data 1
execute if score ndd.time ndd.data matches 0 run function ndd.blizzard:remove
