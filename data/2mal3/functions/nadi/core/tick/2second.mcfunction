# Description: Tick commands every two seconds
# Called from: core/reload, core/tick_slow
# Datapck by 2mal3

# natural disaster timer
execute if entity @r if score $nadi.natural_disaster_on nadi.data matches 0 run scoreboard players remove $nadi.time nadi.data 1
execute if score $nadi.natural_disaster_on nadi.data matches 0 if score $nadi.time nadi.data matches ..0 run function 2mal3:nadi/choose_disaster

# tick slow
schedule function 2mal3:nadi/core/tick/2second 2s
