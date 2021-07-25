# Description: Zombie leaves block mode
# AS: zombie in block mode, AT: @s
# Called from function: 2mal3:nadi/natural_disasters/acid_rain/ticks/second
# Datapack by 2mal3

# Saves that the entity is no longer in block mode
tag @s remove nadi.block

# Remove stunning
#effect clear @s minecraft:slowness
# Remove shulker
#tp @e[type=minecraft:shulker,tag=nadi.block,distance=..0.1] ~ -1000 ~

# Remove block
setblock ~ ~ ~ minecraft:air
# Remove stunning
data modify entity @s NoAI set value 0b
