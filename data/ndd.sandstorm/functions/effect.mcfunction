# Description: sandstorm effects
# Called from: ndd.sandstorm:tick
# Datapack by 2mal3

# ption
effect give @a[gamemode=!spectator] minecraft:blindness 5 0 true
effect give @a[gamemode=!spectator] minecraft:slowness 5 1 true

# particles
execute if score ndd.low_graphics_mode ndd.config matches 0 as @a[gamemode=!spectator] at @s run particle minecraft:falling_dust sand ~ ~ ~ 2 2 2 0 50
execute if score ndd.low_graphics_mode ndd.config matches 1 as @a[gamemode=!spectator] at @s run particle minecraft:falling_dust sand ~ ~ ~ 2 2 2 0 30
