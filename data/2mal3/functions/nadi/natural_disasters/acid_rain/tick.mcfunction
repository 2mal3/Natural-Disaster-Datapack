# Description: The acid_rain tick
# Called from: 2mal3:nadi/natural_disasters/acid_rain/create, 2mal3:nadi/natural_disasters/acid_rain/tick
# Datapck by 2mal3

# remove blocks
execute as @a[gamemode=!spectator,tag=!global.ignore] at @s run function 2mal3:nadi/natural_disasters/acid_rain/summon

execute as @a[gamemode=!spectator,tag=!global.ignore] at @s run spreadplayers ~ ~ 10 40 false @e[sort=nearest,limit=10,tag=nadi.acid_rain,type=minecraft:area_effect_cloud]
execute as @e[tag=nadi.acid_rain,type=minecraft:area_effect_cloud] at @s unless block ~ ~-1 ~ #2mal3:nadi/acid_rain/acid_rain_immune run setblock ~ ~-1 ~ minecraft:air


# give poison
execute as @a[gamemode=!spectator,gamemode=!creative,tag=!global.ignore,tag=!global.ignore.kill] at @s if block ~ ~2 ~ minecraft:air if block ~ ~3 ~ minecraft:air if block ~ ~4 ~ minecraft:air if block ~ ~5 ~ minecraft:air if block ~ ~6 ~ minecraft:air run effect give @s minecraft:poison 2 1 false


# give particle effects
execute as @a[tag=!global.ignore,tag=!global.ignore.gui,gamemode=!spectator] at @s run particle minecraft:sneeze ~ ~ ~ 5 5 5 0 100 force @a[tag=!global.ignore,tag=!global.ignore.gui]


# no sleep
execute as @a[gamemode=!spectator,tag=!global.ignore] at @s if block ~ ~ ~ #minecraft:beds run tp @s ~ ~ ~


# timer
schedule function 2mal3:nadi/natural_disasters/acid_rain/tick 2s

scoreboard players remove $nadi.time nadi.data 1
execute if score $nadi.time nadi.data matches 0 run function 2mal3:nadi/natural_disasters/acid_rain/remove
