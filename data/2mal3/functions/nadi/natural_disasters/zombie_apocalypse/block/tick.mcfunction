# Description: Zombie enter or leave block mode depending of the number of near zombies
# AS: every zombie, AT: @s
# Called from function: 2mal3:nadi/natural_disasters/acid_rain/ticks/second
# Datapack by 2mal3

# Get number of zombie in near of 10 blocks
execute store result score .temp_0 nadi.data run execute if entity @e[type=#2mal3:nadi/zombie_apocalypse/zombie,tag=!nadi.block,distance=..10]

# -
execute if entity @s[tag=!nadi.block] if score .temp_0 nadi.data matches 10.. run function 2mal3:nadi/natural_disasters/zombie_apocalypse/block/enter
execute if entity @s[tag=nadi.block] if score .temp_0 nadi.data matches ..10 run function 2mal3:nadi/natural_disasters/zombie_apocalypse/block/leave
