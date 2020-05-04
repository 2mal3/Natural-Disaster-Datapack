# Description: The thunderstorm tick
# Called from: ndd:natural_disaster/thunderstorm/create
# Datapck by 2mal3

# doline
execute as @e[tag=ndd.doline] at @s run playsound minecraft:entity.zombie.break_wooden_door master @a ~ ~ ~ 10
execute as @e[tag=ndd.doline] at @s run clone ~-5 ~-2 ~-5 ~5 ~5 ~5 ~-5 ~-3 ~-5 masked move
execute as @e[tag=ndd.doline] at @s run tp @s ~ ~-1 ~
execute as @e[tag=ndd.doline] at @s run kill @e[type=minecraft:item,distance=..10]

# timer
schedule function ndd:natural_disaster/doline/tick 5t

scoreboard players add ndd.time ndd.data 1
execute if score ndd.time ndd.data matches 30 run schedule clear ndd:natural_disaster/doline/tick
execute if score ndd.time ndd.data matches 30 run function ndd:natural_disaster/doline/remove
