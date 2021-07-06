# Description: The hurricane loop every minute
# AS: server, AT: server
# Called from functions: 2mal3:nadi/natural_disasters/hurricane/create, 2mal3:nadi/natural_disasters/hurricane/ticks/minute
# Datapck by 2mal3

# Calls this function again in one minutee
schedule function 2mal3:nadi/natural_disasters/hurricane/ticks/minute 60s replace
# Count down the time and then stop the acid rain
scoreboard players remove .time nadi.data 1
execute if score .time nadi.data matches 0 run function 2mal3:nadi/natural_disasters/hurricane/remove
