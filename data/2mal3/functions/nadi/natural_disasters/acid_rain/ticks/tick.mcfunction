# Description: The arcid rain loop every tick
# AS: server, AT: server
# Called from functions: 2mal3:nadi/natural_disasters/acid_rain/create, 2mal3:nadi/natural_disasters/acid_rain/ticks/tick
# Datapack by 2mal3

# Calls this function again in one tick
schedule function 2mal3:nadi/natural_disasters/acid_rain/ticks/tick 1t

# Gives all players who are in the overworld under the open sky the acid rain effects
execute as @a[tag=!global.ignore,predicate=2mal3:nadi/in_overworld,gamemode=!spectator] at @s if predicate 2mal3:nadi/check_sky run particle minecraft:sneeze ~ ~ ~ 5 5 5 0 10 normal
