# Description: First datapack run
# Called from: main/realod
# Datapck by 2mal3

execute store result score ndd.time ndd.data run loot spawn ~ ~ ~ loot ndd:random_time
scoreboard players set ndd.firestorm_on ndd.data 0
scoreboard players set ndd.first ndd.data 1
scoreboard players set ndd.natural_disaster_on ndd.data 0
