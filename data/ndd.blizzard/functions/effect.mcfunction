# Description: Give all players that are under  the sky blizzard effects
# Called from: ndd.blizzard:tick
# Datapack by 2mal3


effect give @s minecraft:blindness 5 0 true
effect give @s minecraft:slowness 5 1 true


# paricle
execute if score ndd.low_graphics_mode ndd.config matches 0 as @a[gamemode=!spectator] at @s run particle minecraft:dust 1 1 1 1 ~ ~ ~ 2 2 2 0 50
execute if score ndd.low_graphics_mode ndd.config matches 0 as @a[gamemode=!spectator] at @s run particle minecraft:dust 1 1 1 1 ~ ~ ~ 2 2 2 0 30
