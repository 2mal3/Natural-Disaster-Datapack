# Description: Commands when reloading the datapack
# Called from function: 2mal3:nadi/core/reload/test
# Datapack by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"Datapack Utilities is present and up-to-date!","color":"green"}]
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"Datapack reloaded!","color":"green"}]



# Adds scoreboards
scoreboard objectives add nadi.data dummy
scoreboard objectives add nadi.debug_mode dummy
scoreboard objectives add nadi.config dummy

scoreboard objectives add nadi.infected_t dummy
scoreboard objectives add nadi.deathCount deathCount
scoreboard objectives add nadi.sound dummy


# Set the version in format: xx.xx.xx
scoreboard players set $nadi.version nadi.data 010101


# Executes the installation when the datapack is started for the first time
execute unless score $nadi.first_run nadi.data matches 1 run schedule function 2mal3:nadi/core/first_run 4s


# Starts the loops
function 2mal3:nadi/core/tick/second
function 2mal3:nadi/core/tick/minute
