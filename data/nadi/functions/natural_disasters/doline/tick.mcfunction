# Description: The doline tick
# Called from: nadi:natural_disasters/doline/create, nadi:natural_disasters/doline/tick
# Datapack by 2mal3

# doline
execute as @e[tag=nadi.doline,type=minecraft:armor_stand] at @s run function nadi:natural_disasters/doline/doline

# timer
schedule function nadi:natural_disasters/doline/tick 5t

scoreboard players remove $nadi.time nadi.data 1
execute if score $nadi.time nadi.data matches 0 run function nadi:natural_disasters/doline/remove
