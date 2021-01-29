# Description: The meteroid tick
# Called from: 2mal3:nadi/natural_disasters/meteoroid/tick, 2mal3:nadi/natural_disasters/meteoroid/create.1
# Datapack by 2mal3

# move meteoroid
execute as @e[tag=nadi.meteoroid.2,type=minecraft:armor_stand] at @s run function 2mal3:nadi/natural_disasters/meteoroid/move

# meteoroid impact
execute store result score $nadi.temp_0 nadi.data as @e[tag=nadi.meteoroid.2,type=minecraft:armor_stand] at @s run execute if block ~ ~-6 ~ minecraft:air
execute if score $nadi.temp_0 nadi.data matches 0 run function 2mal3:nadi/natural_disasters/meteoroid/end


# timer
execute if score $nadi.temp_0 nadi.data matches 1 run schedule function 2mal3:nadi/natural_disasters/meteoroid/tick 1t