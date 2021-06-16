# Description: Registers a natural disaster in the system
# AS: server, AT: server
# Called from function tag: 2mal3:nadi/register
# Datapack by 2mal3

# Counts the number of natural disasters
scoreboard players add $natural_disasters nadi.data 1
# Saves the start function of the natural disaster
data modify storage 2mal3:nadi natural_disasters append value "function 2mal3:nadi/natural_disasters/thunderstorm/create"
