# Description: Registers a natural disaster in the system
# AS: server, AT: server
# Called from function tag: 2mal3:nadi/register
# Datapack by 2mal3

tellraw @a[scores={nadi.debug_mode=4..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"aqua"},{"text":"/","color":"gray"},{"text":"DEBUG","color":"aqua"},{"text": "/","color": "gray"},{"text":"Server", "color": "aqua"},{"text":"]: ","color":"gray"},{"text":"Registerd sandstorm","color":"aqua"}]

# Counts the number of natural disasters
scoreboard players add %natural_disasters nadi.data 1
# Saves the start function of the natural disaster
data modify storage 2mal3:nadi natural_disasters append value "function 2mal3:nadi/natural_disasters/sandstorm/create"
