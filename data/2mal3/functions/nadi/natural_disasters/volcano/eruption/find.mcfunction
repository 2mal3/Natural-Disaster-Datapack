# Description: Starts an eruption at a random loaded volcano
# Called from function: 2mal3:nadi/choose_disaster
# Datapack by 2mal3

execute as @r[gamemode=!spectator,predicate=2mal3:nadi/in_overworld] at @s as @e[type=minecraft:armor_stand,tag=nadi.volcano,sort=nearest,limit=1] at @s run function 2mal3:nadi/natural_disasters/volcano/eruption/eruption
