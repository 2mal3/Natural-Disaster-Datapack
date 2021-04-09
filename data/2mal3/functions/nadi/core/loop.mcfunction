# Description: Datapack loop every minute
# Called from functions: 2mal3:nadi/core/reload , 2mal3:nadi/core/loops/minute
# Datapack by 2mal3

# natural disaster timer
execute if score $nadi.random_natural_disasters nadi.config matches 1 if entity @r if score $nadi.natural_disaster_on nadi.data matches 0 run scoreboard players remove $nadi.time nadi.data 1
execute if score $nadi.random_natural_disasters nadi.config matches 1 if score $nadi.natural_disaster_on nadi.data matches 0 if score $nadi.time nadi.data matches ..0 run function 2mal3:nadi/choose_disaster/choose_disaster

# Calls the function in the next second
schedule function 2mal3:nadi/core/loop 60s
