# Description: Tests if Datapack Utilities is installed or too old
# Called from tag: load:post_load
# Datapack by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"Tests if Datapack Utilities is installed or too old ...","color":"green"}] 

# Du is installed
execute if score $du.ver load matches 2020104.. run schedule function 2mal3:nadi/core/reload/true 4s

# Du is not installed
execute unless score $du.ver load matches 2020104.. run schedule function 2mal3:nadi/core/reload/false 4s
