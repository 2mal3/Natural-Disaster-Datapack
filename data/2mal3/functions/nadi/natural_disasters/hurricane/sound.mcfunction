# Description: Plays sound effects for players in the nerar of the hurricane
# Called from: 2mal3:nadi/natural_disasters/hurricane/tick
# Datapack by 2mal3

# break noise
execute if predicate 2mal3:nadi/hurricane/random_sound run playsound minecraft:entity.zombie.break_wooden_door master @s ~ ~ ~ 9999 0.1

# hurricane loop
scoreboard players remove @s[scores={nadi.sound=1..}] nadi.sound 1
execute unless score @s nadi.sound matches 1.. run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 99999 1.5
execute unless score @s nadi.sound matches 1.. run scoreboard players set @s nadi.sound 55