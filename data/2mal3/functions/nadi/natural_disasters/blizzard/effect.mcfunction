# Description: Give all players that are under  the sky blizzard effects
# Called from: 2mal3:nadi/natural_disasters/blizzard/tick
# Datapack by 2mal3

# sound effects
scoreboard players remove @s[scores={nadi.sound=1..}] nadi.sound 1
execute unless score @s nadi.sound matches 1.. run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 99999 1
execute unless score @s nadi.sound matches 1.. run scoreboard players set @s nadi.sound 10

# potion effects
effect give @s minecraft:blindness 5 0 true
effect give @s minecraft:slowness 5 1 true

# place random snow around the player and stack it
execute if block ~ ~2 ~ minecraft:air if block ~ ~3 ~ minecraft:air if block ~ ~4 ~ minecraft:air if block ~ ~5 ~ minecraft:air if block ~ ~6 ~ minecraft:air run function 2mal3:nadi/natural_disasters/blizzard/summon
spreadplayers ~ ~ 2 7 false @e[sort=nearest,limit=5,tag=nadi.blizzard,type=minecraft:area_effect_cloud]

# paricle effects
tag @s add nadi.blizzard_effect
