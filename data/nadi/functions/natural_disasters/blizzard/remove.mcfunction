# Description: Removes the blizzard
# Called from: nadi:natural_disasters/blizzard/tick
# Datapack by 2mal3

# send remove message
execute if score nadi.notifications_on nadi.config matches 1 run tellraw @a {"translate":"The blizzard stops.","color":"gray"}

# remove all blizzard stuff
kill @e[type=minecraft:armor_stand,tag=nadi.blizzard]
scoreboard players reset @a[scores={nadi.sound=1..}] nadi.sound
scoreboard players set $nadi.blizzard nadi.data 0

# other
schedule clear nadi:natural_disasters/blizzard/tick
scoreboard players set $nadi.natural_disaster_on nadi.data 0
function nadi:new_time
