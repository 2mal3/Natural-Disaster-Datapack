# Description: Heals and speeds up zombies that hit a player
# AS: player that was hurt by a zombie, AT: @s
# Called from advancement: 2mal3:nadi/zombie_hurt_player
# Datapack by 2mal3

# Reset advancement
advancement revoke @s only 2mal3:nadi/zombie_hurt_player
# Gives the zombie a short speed buff
execute as @e[type=#2mal3:nadi/zombie_apocalypse/zombie,tag=!nadi.block,sort=nearest,limit=1] run effect give @s minecraft:speed 1 0 true
