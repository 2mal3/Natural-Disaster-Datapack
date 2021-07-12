# Description: The hail loop every second
# AS: server, AT: server
# Called from functions: 2mal3:nadi/natural_disasters/hail/create, 2mal3:nadi/natural_disasters/hail/ticks/second
# Datapack by 2mal3

# Calls this function again in one second
schedule function 2mal3:nadi/natural_disasters/hail/ticks/second 1s replace

# Summon anchors in range of 40 around each player
execute as @a[tag=!global.ignore,gamemode=!spectator,predicate=2mal3:nadi/in_overworld] at @s run function 2mal3:nadi/natural_disasters/hail/summon
# Summon the hail above each anchor entity
execute as @e[type=minecraft:area_effect_cloud,tag=nadi.anchor] at @s run summon falling_block ~ 255 ~ {BlockState: {Name: "minecraft:ice"}, Time: 1, HurtEntities: 1b, FallHurtMax: 40, FallHurtAmount: 0.03f}
