# Description: Zombie enters block mode
# AS: zombie not in block mode, AT: @s
# Called from function: 2mal3:nadi/natural_disasters/acid_rain/ticks/second
# Datapack by 2mal3

# Saves that the entity is in block mode
tag @s add nadi.block

# Stops the movement of the zombie
effect give @s minecraft:slowness 999999 255 true
# Summon invisible shulker so other zombies can stap on
summon minecraft:shulker ~ ~ ~ {Silent: 1b, Invulnerable: 1b, NoAI: 1b, AttachFace: 0b, Tags: ["nadi.block"], ActiveEffects: [{Id: 14b, Amplifier: 1b, Duration: 999999, ShowParticles: 0b}]}
