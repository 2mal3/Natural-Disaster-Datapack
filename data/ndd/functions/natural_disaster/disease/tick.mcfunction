# Description: The disease tick
# Called from: ndd:natural_disaster/disease/create
# Datapck by 2mal3

# no infectable
execute as @e[type=#ndd:not_infectable] run tag @s add ndd.not_infectable


# statistics
scoreboard players set ndd.infected ndd.data 0
execute as @e[tag=ndd.infected,type=!#ndd:not_infectable,tag=!ndd.not_infectable] run scoreboard players add ndd.infected ndd.data 1


# infected
execute as @e[tag=ndd.infected,type=!#ndd:not_infectable,tag=!ndd.not_infectable] run scoreboard players add @s ndd.infected_t 1

execute as @e[scores={ndd.infected_t=30..},type=!#ndd:not_infectable,tag=!ndd.not_infectable] at @s as @e[distance=..2,type=!#ndd:not_infectable,tag=!ndd.not_infectable,tag=!ndd.infected] unless score @s ndd.infected_t matches 1.. run function ndd:natural_disaster/disease/infect


# if a infectet player dies
execute as @a[scores={ndd.deathCount=1..}] run function ndd:natural_disaster/disease/death


# effects
execute as @e[scores={ndd.infected_t=90..},type=!#ndd:not_infectable,tag=!ndd.not_infectable] at @s run function ndd:natural_disaster/disease/effect_1
execute as @e[scores={ndd.infected_t=120..},type=!#ndd:not_infectable,tag=!ndd.not_infectable] at @s run function ndd:natural_disaster/disease/effect_2
execute as @e[scores={ndd.infected_t=150..},type=!#ndd:not_infectable,tag=!ndd.not_infectable] at @s run function ndd:natural_disaster/disease/effect_3
execute as @e[scores={ndd.infected_t=180..},type=!#ndd:not_infectable,tag=!ndd.not_infectable] at @s run function ndd:natural_disaster/disease/effect_4
execute as @e[scores={ndd.infected_t=210..},type=!#ndd:not_infectable,tag=!ndd.not_infectable] at @s run function ndd:natural_disaster/disease/effect_5
execute as @e[scores={ndd.infected_t=240..},type=!#ndd:not_infectable,tag=!ndd.not_infectable] at @s run function ndd:natural_disaster/disease/effect_6


# healed
execute as @e[tag=!ndd.infected,type=!#ndd:not_infectable,scores={ndd.infected_t=1..}] run scoreboard players remove @s ndd.infected_t 1


# heals entitys that are in the near of the dropped remedy
execute as @e[type=minecraft:item,predicate=ndd:remedy] at @s as @e[type=!#ndd:not_infectable,tag=!ndd.not_infectable,tag=ndd.infected,distance=..2] run function ndd:natural_disaster/disease/heal


# timer
schedule function ndd:natural_disaster/disease/tick 1s

execute if score ndd.infected ndd.data matches 0 run function ndd:natural_disaster/disease/remove
