# Description: Tick commands every two seconds
# Called from: main/reload, main/tick_slow
# Datapck by 2mal3

# natural disaster timer
execute if entity @r if score $nadi.natural_disaster_on nadi.data matches 0 run scoreboard players remove $nadi.time nadi.data 1
execute if score $nadi.natural_disaster_on nadi.data matches 0 if score $nadi.time nadi.data matches ..0 run function nadi:choose_disaster

# tick slow
schedule function nadi:main/tick/2second 2s
