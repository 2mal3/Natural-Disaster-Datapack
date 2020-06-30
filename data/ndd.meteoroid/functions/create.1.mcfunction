# Description: Creat a meteroid
# Called from: ndd:choose_disaster
# Datapck by 2mal3

execute if score ndd.notifications_on ndd.config matches 1 run tellraw @a {"translate":"A meteoroid begins.","color":"gray"}

execute as @r[gamemode=!spectator] at @s run function ndd.meteoroid:create.2


schedule function ndd.meteoroid:tick 2s
