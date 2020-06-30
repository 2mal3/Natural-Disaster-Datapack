# Description: collecting debug infos
# Called from: #debug
# Datapack by 2mal3

tellraw @s {"text":""}
tellraw @s {"text":"Collecting Infos ...","color":"gray"}

execute store result score ndd.temp_0 ndd.data run data get entity @s DataVersion
scoreboard players operation ndd.temp_1 ndd.data = ndd.time ndd.data

tag @s add ndd.debug
schedule function ndd:debug/2 1s
