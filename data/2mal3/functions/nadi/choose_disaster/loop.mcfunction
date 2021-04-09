# Description: Recursively deletes a specified number of natural disasters from temporary storage
# AS: server, AT: server
# Called from function: 2mal3:nadi/choose_disaster/start
# Datapack by 2mal3

scoreboard players remove .out_0 2mal3.random 1

execute if score .out_0 2mal3.random matches 1.. run data remove storage 2mal3:nadi temp[0]
execute if score .out_0 2mal3.random matches 1.. run function 2mal3:nadi/choose_disaster/loop
