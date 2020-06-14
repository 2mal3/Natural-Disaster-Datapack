# Description: eruption at a volcano
# Called from: ndd.volcano:eruption/1
# Datapack by 2mal3


# vulcan effects
execute as @e[distance=..64] run data merge entity @s {Fire:1200}
effect give @e[distance=..64] minecraft:blindness 60 0 true
playsound minecraft:entity.ender_dragon.death master @a[distance=..64] ~ ~ ~ 64 0.1


# explosion
summon minecraft:creeper ~ ~ ~ {ExplosionRadius:5b,Fuse:0}

# flying blocks
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:magma_block"},Time:1,Motion:[0.0,1.0,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:magma_block"},Time:1,Motion:[0.0,1.0,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:magma_block"},Time:1,Motion:[0.0,1.0,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:magma_block"},Time:1,Motion:[0.0,1.0,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:magma_block"},Time:1,Motion:[0.0,1.0,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:magma_block"},Time:1,Motion:[0.0,1.0,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:magma_block"},Time:1,Motion:[0.0,1.0,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:magma_block"},Time:1,Motion:[0.0,1.0,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:magma_block"},Time:1,Motion:[0.0,1.0,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:magma_block"},Time:1,Motion:[0.0,1.0,0.0]}

summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:lava"},Time:1,Motion:[0.0,0.5,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:lava"},Time:1,Motion:[0.0,1.0,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:lava"},Time:1,Motion:[0.0,1.0,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:lava"},Time:1,Motion:[0.0,1.0,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:lava"},Time:1,Motion:[0.0,1.0,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:lava"},Time:1,Motion:[0.0,1.0,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:lava"},Time:1,Motion:[0.0,1.0,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:lava"},Time:1,Motion:[0.0,1.0,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:lava"},Time:1,Motion:[0.0,1.0,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:lava"},Time:1,Motion:[0.0,1.0,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:lava"},Time:1,Motion:[0.0,1.0,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:lava"},Time:1,Motion:[0.0,1.0,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:lava"},Time:1,Motion:[0.0,1.0,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:lava"},Time:1,Motion:[0.0,1.0,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:lava"},Time:1,Motion:[0.0,1.0,0.0]}

summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:cobblestone"},Time:1,Motion:[0.0,0.5,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:cobblestone"},Time:1,Motion:[0.0,1.0,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:cobblestone"},Time:1,Motion:[0.0,1.0,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:cobblestone"},Time:1,Motion:[0.0,1.0,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:cobblestone"},Time:1,Motion:[0.0,1.0,0.0]}

summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:obsidian"},Time:1,Motion:[0.0,0.5,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:obsidian"},Time:1,Motion:[0.0,1.0,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:obsidian"},Time:1,Motion:[0.0,1.0,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:obsidian"},Time:1,Motion:[0.0,1.0,0.0]}
summon minecraft:falling_block ~ ~ ~ {BlockState:{Name:"minecraft:obsidian"},Time:1,Motion:[0.0,1.0,0.0]}

execute as @e[type=minecraft:falling_block,distance=..1] at @s run function ndd.volcano:eruption/random_motion
