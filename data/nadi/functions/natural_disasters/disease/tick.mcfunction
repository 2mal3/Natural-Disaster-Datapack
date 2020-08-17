# Description: The disease tick
# Called from: nadi:natural_disasters/disease/create
# Datapck by 2mal3

# makers the entitys that not can be infectet
execute as @e[type=#nadi:disease/not_infectable] run tag @s add nadi.not_infectable
execute as @e[type=#nadi:disease/not_infectable,tag=!global.ignore] run tag @s add nadi.not_infectable
execute as @e[type=#nadi:disease/not_infectable,tag=!global.ignore.kill] run tag @s add nadi.not_infectable


# stores the ammount of infected entitys
scoreboard players set $nadi.infected nadi.data 0
execute as @e[tag=nadi.infected,type=!#nadi:disease/not_infectable,tag=!nadi.not_infectable] run scoreboard players add $nadi.infected nadi.data 1


# increase the infected time and infect other entitys
execute as @e[tag=nadi.infected,type=!#nadi:disease/not_infectable,tag=!nadi.not_infectable] run scoreboard players add @s nadi.infected_t 1
execute as @e[scores={nadi.infected_t=300..},type=!#nadi:disease/not_infectable,tag=!nadi.not_infectable] at @s as @e[distance=..2,type=!#nadi:disease/not_infectable,tag=!nadi.not_infectable,tag=!nadi.infected] unless score @s nadi.infected_t matches 1.. run function nadi:natural_disasters/disease/infect


# if a infectet player dies
execute as @a[scores={nadi.deathCount=1..}] run function nadi:natural_disasters/disease/death


# bad effects for infectetd entitys
execute as @e[scores={nadi.infected_t=720..},type=!#nadi:disease/not_infectable,tag=!nadi.not_infectable] at @s run function nadi:natural_disasters/disease/effect_1
execute as @e[scores={nadi.infected_t=840..},type=!#nadi:disease/not_infectable,tag=!nadi.not_infectable] at @s run function nadi:natural_disasters/disease/effect_2
execute as @e[scores={nadi.infected_t=960..},type=!#nadi:disease/not_infectable,tag=!nadi.not_infectable] at @s run function nadi:natural_disasters/disease/effect_3
execute as @e[scores={nadi.infected_t=1080..},type=!#nadi:disease/not_infectable,tag=!nadi.not_infectable] at @s run function nadi:natural_disasters/disease/effect_4
execute as @e[scores={nadi.infected_t=1200..},type=!#nadi:disease/not_infectable,tag=!nadi.not_infectable] at @s run function nadi:natural_disasters/disease/effect_5
execute as @e[scores={nadi.infected_t=1320..},type=!#nadi:disease/not_infectable,tag=!nadi.not_infectable] at @s run function nadi:natural_disasters/disease/effect_6


# reduce the infected score from healded entitys
execute as @e[tag=!nadi.infected,type=!#nadi:disease/not_infectable,scores={nadi.infected_t=1..}] run scoreboard players remove @s nadi.infected_t 1


# heals entitys that are in the near of the dropped remedy
execute as @e[type=minecraft:item,predicate=nadi:disease/remedy] at @s as @e[type=!#nadi:disease/not_infectable,tag=!nadi.not_infectable,tag=nadi.infected,distance=..2] run function nadi:natural_disasters/disease/heal


# timer
schedule function nadi:natural_disasters/disease/tick 1s

execute if score $nadi.infected nadi.data matches 0 run function nadi:natural_disasters/disease/remove
