# Description: starts a volcano eruption at a random volcano
# Called from: ndd:choose_disaster
# Datapack by 2mal3

execute as @e[type=minecraft:armor_stand,tag=ndd.volcano,sort=random,limit=1] at @s run function ndd.volcano/eruption/2
