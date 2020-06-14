# Description: The doline tick
# Called from: ndd.doline:create, ndd.doline:tick
# Datapack by 2mal3

# doline
execute as @e[tag=ndd.doline] at @s run function ndd.doline:doline

# timer
schedule function ndd.doline:tick 5t

scoreboard players remove ndd.time ndd.data 1
execute if score ndd.time ndd.data matches 0 run function ndd.doline:remove
