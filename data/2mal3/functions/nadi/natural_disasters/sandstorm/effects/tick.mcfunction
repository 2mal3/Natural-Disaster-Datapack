# Description: Performs all kinds of things for players who are under the free sky
# Called from function: 2mal3:nadi/natural_disasters/sandstorm/ticks/tick
# Datapack by 2mal3

particle minecraft:block minecraft:sand ~ ~ ~ 5 5 5 0 50

execute if block ~0.3 ~ ~ air run tp @s ~0.05 ~ ~