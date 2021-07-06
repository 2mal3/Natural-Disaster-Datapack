# Description: Tests all new players to see if the minecraft or server version is wrong and tells them so
# AS: player that newly enter the world, AT: @s
# Called from advancements: 2mal3:nadi/first_join
# Datapack by 2mal3

# Collects data
# Minecraft Version
execute store result score .temp_0 nadi.data run data get entity @s DataVersion

# Server software
scoreboard players set .temp_1 nadi.data 0
execute unless score .temp_1 nadi.data matches 1.. store success score .temp_1 nadi.data run data get entity @s "Spigot.ticksLived"
execute unless score .temp_1 nadi.data matches 1.. store success score .temp_1 nadi.data run data get entity @s "Bukkit.updateLevel"
execute unless score .temp_1 nadi.data matches 1.. store success score .temp_1 nadi.data run data get entity @s "Paper.SpawnReason"

# Command blocks
scoreboard players set .temp_2 nadi.data 0
setblock 7162814 2 5656277 minecraft:repeating_command_block{Command: "/scoreboard players set .temp_2 nadi.data 1", auto: 1b}

# Prints out if something is wrong
tag @s add nola.this
schedule function 2mal3:nadi/core/first_join/print 2t
