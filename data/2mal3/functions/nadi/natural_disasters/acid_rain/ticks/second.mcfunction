# Description: The arcid rain loop every second
# AS: server, AT: server
# Called from functions: 2mal3:nadi/natural_disasters/acid_rain/create, 2mal3:nadi/natural_disasters/acid_rain/ticks/second
# Datapack by 2mal3

# Calls this function again in one second
schedule function 2mal3:nadi/natural_disasters/acid_rain/ticks/second 1s replace

# Gives all players who are in the overworld under the open sky poison
execute as @e[tag=!global.ignore,predicate=2mal3:nadi/in_overworld,team=!this_team_does_not_exist] at @s if predicate 2mal3:nadi/check_sky run effect give @s minecraft:wither 2 1 false

# Summons anchor entities in a range of 40 blocks around every normal player
execute as @a[gamemode=!spectator,tag=!global.ignore,predicate=2mal3:nadi/in_overworld] at @s run function 2mal3:nadi/natural_disasters/acid_rain/remove_blocks
# Reoves the block under the anchor entities
execute as @e[type=minecraft:area_effect_cloud,tag=nadi.anchor] at @s unless block ~ ~-1 ~ #2mal3:nadi/acid_rain/acid_rain_immune run setblock ~ ~-1 ~ minecraft:air
