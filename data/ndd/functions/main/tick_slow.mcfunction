# Description: slower tick commands
# Called from: main/reload, main/tick_slow
# Datapck by 2mal3

# natural disaster timer
execute if score ndd.natural_disaster_on ndd.data matches 0 run scoreboard players remove ndd.time ndd.data 1
execute if score ndd.natural_disaster_on ndd.data matches 0 run execute if score ndd.time ndd.data matches 0 run function ndd:choose_disaster

# tick slow
schedule function ndd:main/tick_slow 2s
