# Description: Commands when reloading the datapack
# Called from tag: minecraft:reaload
# Datapack by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"Datapack reloaded!","color":"green"}]


# Add basic scoreboards
scoreboard objectives add nadi.data dummy

# Initializes the datapack at the first startup or new version
execute unless score $nadi.first_run nadi.data matches 1 run function 2mal3:nadi/core/first_run/main
execute if score $nadi.first_run nadi.data matches 1 unless score $nadi.version nadi.data matches 020000 run function 2mal3:nadi/core/first_run/update

# Starts the loops
schedule function 2mal3:nadi/core/loops/minute 60s replace
