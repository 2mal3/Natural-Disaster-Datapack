# Description: Datapack loop every minute
# AS: server, AT: server
# Called from functions: 2mal3:nadi/core/reload, 2mal3:nadi/core/loops/minute
# Datapack by 2mal3

# Counts the time until the next natural disaster
execute if score $random_natural_disasters nadi.config matches 1 if entity @r if score %natural_disaster_on nadi.data matches 0 run scoreboard players remove %time nadi.data 1
execute if score $random_natural_disasters nadi.config matches 1 if score %natural_disaster_on nadi.data matches 0 if score %time nadi.data matches ..0 run function 2mal3:nadi/choose_disaster/choose_disaster

# Calls the function in the next second
schedule function 2mal3:nadi/core/loop 60s
