# Description: Removes the thunderstorm
# Called from: ndd.thunderstorm:tick
# Datapck by 2mal3

execute as @e[tag=ndd.doline] at @s run fill ~-5 ~-34 -5 ~5 ~-34 ~5 minecraft:obsidian
schedule clear ndd.doline:tick
kill @e[tag=ndd.doline]

function ndd:new_time
scoreboard players set ndd.natural_disaster_on ndd.data 0
