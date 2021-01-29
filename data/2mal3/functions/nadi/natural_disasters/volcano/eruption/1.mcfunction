# Description: starts a volcano eruption at a random volcano
# Called from: 2mal3:nadi/choose_disaster
# Datapack by 2mal3

execute as @r[tag=!global.ignore,gamemode=!spectator] at @s as @e[type=minecraft:armor_stand,tag=nadi.volcano,sort=nearest,limit=1] at @s run function 2mal3:nadi/natural_disasters/volcano/eruption/2
