# Description: Tests all new players to see if the minecraft or server version is wrong and tells them so
# Called from tag: 2mal3:nadi/debug
# Datapack by 2mal3

# Collects the data
execute store result score .temp_0 nadi.data run data get entity @s DataVersion

scoreboard players set .temp_1 nadi.data 0
execute unless score .temp_1 nadi.data matches 1.. store success score .temp_1 nadi.data run data get entity @s "Spigot.ticksLived"
execute unless score .temp_1 nadi.data matches 1.. store success score .temp_1 nadi.data run data get entity @s "Bukkit.updateLevel"
execute unless score .temp_1 nadi.data matches 1.. store success score .temp_1 nadi.data run data get entity @s "Paper.SpawnReason"

# Gives an error message for wrong versions
execute unless score .temp_0 nadi.data matches 2584.. run tellraw @s [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"dark_red"},{"text":"/","color":"gray"},{"text":"FATAL","color":"dark_red"},{"text":"]: ","color":"gray"},{"text":"This Minecraft version is not supported by the datapack. Please use a version later than 1.16.","color":"dark_red"}]

execute if score .temp_1 nadi.data matches 1 run tellraw @s [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"gold"},{"text":"/","color":"gray"},{"text":"WARN","color":"gold"},{"text":"]: ","color":"gray"},{"text":"This Minecraft version is not supported by the datapack. Please use a version later than 1.16.","color":"gold"}]

execute unless score $du.ver load matches 2020104.. run tellraw @s [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"red"},{"text":"/","color":"gray"},{"text":"ERROR","color":"red"},{"text":"]: ","color":"gray"},{"text":"Datapack Utilities not installed or out of date. Please use the latest version of Datapack Utilities to make the datapack work properly.","color":"red"}]
