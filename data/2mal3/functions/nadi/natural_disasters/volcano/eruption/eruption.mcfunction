# Description: A eruption at a volcano
# AS: Volcano marker in the near of a player, AT: @s
# Called from function: 2mal3:nadi/natural_disasters/volcano/eruption/find
# Datapack by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"A volcanic eruption is started.","color":"green"}]


# The effects of the volcanic eruption on entitys
execute as @e[team=!this_team_does_not_exist,tag=!global.ignore,tag=!global.ignore.kill,distance=..128] run function 2mal3:nadi/natural_disasters/volcano/eruption/effect
# Plays the breakout sound to all nearby players
playsound minecraft:entity.ender_dragon.death master @a[distance=..128] ~ ~ ~ 128 0

# Makes the crater explode
summon minecraft:creeper ~ ~ ~ {ExplosionRadius: 6b, Fuse: 0}


# Creates falling blocks
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:magma_block"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:magma_block"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:magma_block"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:magma_block"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:magma_block"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:magma_block"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:magma_block"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:magma_block"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:magma_block"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:magma_block"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}

summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:lava"}, Time: 1, Motion: [0.0d, 0.5d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:lava"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:lava"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:lava"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:lava"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:lava"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:lava"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:lava"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:lava"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:lava"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:lava"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:lava"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:lava"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:lava"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:lava"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}

summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:cobblestone"}, Time: 1, Motion: [0.0d, 0.5d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:cobblestone"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:cobblestone"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:cobblestone"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:cobblestone"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}

summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:obsidian"}, Time: 1, Motion: [0.0d, 0.5d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:obsidian"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:obsidian"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:obsidian"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}
summon minecraft:falling_block ~ ~ ~ {BlockState: {Name: "minecraft:obsidian"}, Time: 1, Motion: [0.0d, 1.0d, 0.0d]}

# Gives random direction to the falling blocks
execute as @e[type=minecraft:falling_block,distance=..1] at @s run function 2mal3:nadi/natural_disasters/volcano/eruption/random_motion


# Sets a new time until the next natural disaster begins
function 2mal3:nadi/new_time
