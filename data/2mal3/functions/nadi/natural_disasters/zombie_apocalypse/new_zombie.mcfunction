# Description: Buffes every new zombie 
# AS: every new zombie, AT: server
# Called from function: 2mal3:nadi/natural_disasters/zombie_apocalypse/ticks/second
# Datapack by 2mal3

tellraw @a[scores={nadi.debug_mode=4..}] [{"text":"[","color":"gray"},{"text":"NaturalDisasters","color":"aqua"},{"text":"/","color":"gray"},{"text":"DEBUG","color":"aqua"},{"text": "/","color": "gray"},{"selector":"@s", "color": "aqua"},{"text":"]: ","color":"gray"},{"text":"Buffed zombie","color":"aqua"}]

# Remembert that the zombie was buffed
tag @s add nadi.processed

# Makes that the zombie can pick up loot, can break doors, have a higher range and summon other zombies
data merge entity @s {CanPickUpLoot: 1b, CanBreakDoors: 1b, Attributes: [{Name: generic.follow_range, Base: 80}, {Name: zombie.spawn_reinforcements, Base: 30}], ArmorItems: [{}, {}, {}, {id: "minecraft:stone_button", Count: 1b, tag: {dead_zombie: 1b}}], ArmorDropChances: [0.085f, 0.085f, 0.085f, 1.000f]}
