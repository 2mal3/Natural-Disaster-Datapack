# Description: The arcid rain loop every minute
# Called from functions: 2mal3:nadi/natural_disasters/acid_rain/create, 2mal3:nadi/natural_disasters/acid_rain/ticks/minute
# Datapck by 2mal3

# Calls this function again in one minute
schedule function 2mal3:nadi/natural_disasters/acid_rain/ticks/minute 60s

# Count down the time and then stop the acid rain
scoreboard players remove $nadi.time nadi.data 1
execute if score $nadi.time nadi.data matches 0 run function 2mal3:nadi/natural_disasters/acid_rain/remove