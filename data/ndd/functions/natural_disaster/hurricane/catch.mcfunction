# Description: catches the entitys
# Called from: ndd:natural_disaster/hurricane/tick
# Datapck by 2mal3

effect give @s minecraft:levitation 5 3 true

execute if entity @e[tag=ndd.hurricane,type=minecraft:armor_stand,distance=5..25] facing entity @e[tag=ndd.hurricane,type=minecraft:armor_stand,distance=5..25] feet run tp @s ^ ^ ^0.25
