# Description: Place the meteoroid
# Called from: ndd.meteoroid:place
# Datapck by 2mal3

execute as @e[tag=ndd.meteoroid.2] at @s run setblock ~-5 ~-5 ~-5 minecraft:structure_block[mode=load]{name:"ndd.meteoroid:meteoroid",rotation:"NONE",mirror:"NONE",mode:"LOAD"} replace
execute as @e[tag=ndd.meteoroid.2] at @s run setblock ~-5 ~-4 ~-5 minecraft:redstone_block

scoreboard players set ndd.natural_disaster_on ndd.data 0
kill @e[tag=ndd.meteoroid.2]
