# Description: starts a volcano eruption at a random volcano
# Called from: nadi:choose_disaster
# Datapack by 2mal3

execute as @r[tag=!global.ignore,gamemode=!spectator] at @s as @e[type=minecraft:armor_stand,tag=nadi.volcano,sort=nearest,limit=1] at @s run function nadi:natural_disasters/volcano/eruption/2
