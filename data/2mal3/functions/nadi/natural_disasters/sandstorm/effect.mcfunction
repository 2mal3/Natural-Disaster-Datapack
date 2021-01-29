# Description: sandstorm effects
# Called from: 2mal3:nadi/natural_disasters/sandstorm/tick
# Datapack by 2mal3

# sound
scoreboard players remove @s[scores={nadi.sound=1..}] nadi.sound 1
execute unless score @s nadi.sound matches 1.. run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 99999 1
execute unless score @s nadi.sound matches 1.. run scoreboard players set @s nadi.sound 10

# potion
effect give @s minecraft:blindness 5 0 true
effect give @s minecraft:slowness 5 1 true

tag @s add nadi.sandstorm_effect
