# Description: Main loop every tick
# Called from tag: minecraft:tick
# Datapack by 2mal3

# sandstorm effects
execute if score $nadi.sandstorm nadi.data matches 1 as @a[tag=nadi.sandstorm_effect,tag=!global.ignore,tag=!global.ignore.gui,gamemode=!spectator] at @s run particle minecraft:falling_dust minecraft:sand ~ ~ ~ 4 4 4 0 15 force @a[tag=!global.ignore,tag=!global.ignore.gui]