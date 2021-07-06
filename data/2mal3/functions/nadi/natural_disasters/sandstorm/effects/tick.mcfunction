# Description: Performs all kinds of things for players who are under the free sky
# AS: every player under the sky, AT: @s
# Called from function: 2mal3:nadi/natural_disasters/sandstorm/ticks/tick
# Datapack by 2mal3

# Shows sand particles
particle minecraft:block minecraft:sand ~ ~ ~ 5 5 5 0 50
# Push the players to the side
execute if block ~0.3 ~ ~ air run tp @s ~0.05 ~ ~
