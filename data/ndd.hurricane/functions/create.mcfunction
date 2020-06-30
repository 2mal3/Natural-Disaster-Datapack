# Description: Creat a hurricane
# Called from: ndd:choose_disaster
# Datapack by 2mal3

execute if score ndd.notifications_on ndd.config matches 1 run tellraw @a {"translate":"A hurricane begins.","color":"gray"}


weather thunder 99999

execute as @r[gamemode=!spectator,limit=1] at @s run function ndd.hurricane:summon



scoreboard players operation ndd.time ndd.data = ndd.hurricane_time ndd.config
scoreboard players set ndd.natural_disaster_on ndd.data 1
function #ndd_api:hurricane_time

schedule function ndd.hurricane:tick 10s
