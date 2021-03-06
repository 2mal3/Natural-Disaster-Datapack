# Description: Main loop every tick
# Called from tag: minecraft:tick
# Datapack by 2mal3

# firestorm particles
execute if score $nadi.firestorm_on nadi.data matches 1 as @e[type=minecraft:slime,tag=nadi.firestorm.s] at @s run particle minecraft:flame ~ ~ ~ 0 0 0 0 3 force @a[tag=!global.ignore,tag=!global.ignore.gui]

# sandstorm effects
execute if score $nadi.sandstorm nadi.data matches 1 as @a[tag=nadi.sandstorm_effect,tag=!global.ignore,tag=!global.ignore.gui,gamemode=!spectator] at @s run particle minecraft:falling_dust minecraft:sand ~ ~ ~ 4 4 4 0 15 force @a[tag=!global.ignore,tag=!global.ignore.gui]