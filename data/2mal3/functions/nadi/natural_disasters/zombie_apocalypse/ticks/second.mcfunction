# Description: The zombie apocalypse rain loop every second
# AS: server, AT: server
# Called from functions: 2mal3:nadi/natural_disasters/zombie_apocalypse/create, 2mal3:nadi/natural_disasters/zombie_apocalypse/ticks/second
# Datapack by 2mal3

# Calls this function again in one second
schedule function 2mal3:nadi/natural_disasters/zombie_apocalypse/ticks/second 1s replace

# Every zombie type joins a team
team join nadi.zombies @e[type=#2mal3:nadi/zombie_apocalypse/zombie]

# Buffes every new zombie
execute as @e[type=#2mal3:nadi/zombie_apocalypse/zombie,tag=!nadi.processed] run function 2mal3:nadi/natural_disasters/zombie_apocalypse/new_zombie
# Zombies can step on each other
execute as @e[type=#2mal3:nadi/zombie_apocalypse/zombie] at @s run function 2mal3:nadi/natural_disasters/zombie_apocalypse/block/tick
# Detect the death point died zombis
execute as @e[type=minecraft:item,predicate=2mal3:nadi/zombie_apocalypse/dead_zombie] at @s run function 2mal3:nadi/natural_disasters/zombie_apocalypse/dead_body
