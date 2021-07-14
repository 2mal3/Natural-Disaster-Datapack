# Description: The zombie apocalypse loop every minute
# AS: server, AT: server
# Called from functions: 2mal3:nadi/natural_disasters/zombie_apocalypse/create, 2mal3:nadi/natural_disasters/zombie_apocalypse/ticks/minute
# Datapack by 2mal3

# Calls this function again in one minute
schedule function 2mal3:nadi/natural_disasters/zombie_apocalypse/ticks/minute 60s replace

# Summons a few extra zombies in the near of every normal player
execute as @a[tag=!global.ignore,gamemode=!spectator,predicate=2mal3:nadi/in_overworld] at @s run function 2mal3:nadi/natural_disasters/zombie_apocalypse/extra_zombies
# Spawn extra zombies at the choosen positions
execute as @e[type=minecraft:area_effect_cloud,tag=nadi.anchor] at @s run summon minecraft:zombie ~ ~ ~ {Tags: ["nadi.nadi.processed"], CanPickUpLoot: 1b, CanBreakDoors: 1b, Attributes: [{Name: generic.follow_range, Base: 80}, {Name: zombie.spawn_reinforcements, Base: 30}], ArmorItems: [{}, {}, {}, {id: "minecraft:stone_button", Count: 1b, tag: {dead_zombie: 1b}}], ArmorDropChances: [0.085f, 0.085f, 0.085f, 1.000f]}

# Count down the time and then stop the acid rain
scoreboard players remove .time nadi.data 1
execute if score .time nadi.data matches 0 run function 2mal3:nadi/natural_disasters/zombie_apocalypse/remove
