# Description: The main loop of the blzzard every second
# AS: server, AT: server
# Called from functions: 2mal3:nadi/natural_disasters/sandstorm/create, 2mal3:nadi/natural_disasters/sandstorm/ticks/second
# Datapack by 2mal3

# Calls this function again in one second
schedule function 2mal3:nadi/natural_disasters/sandstorm/ticks/second 1s replace

# Performs all kinds of things for players who are under the free sky
execute as @a[tag=!global.ignore,predicate=2mal3:nadi/in_overworld,gamemode=!spectator] at @s if predicate 2mal3:nadi/check_sky run function 2mal3:nadi/natural_disasters/sandstorm/effects/second
# Summons above every anchor entity faling sand
execute as @e[type=minecraft:area_effect_cloud,tag=nadi.anchor] at @s run summon minecraft:falling_block ~ 255 ~ {BlockState: {Name: "minecraft:sand"}, Time: 1}
