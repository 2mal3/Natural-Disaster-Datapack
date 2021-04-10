# Description: Prevents sleeping in bed when activated
# Called from advancement: 2mal3:nadi/selpt_in_bed
# Datapck by 2mal3

# Output debug message in chat, if enabled (DEBUG)
tellraw @a[scores={nadi.debug_mode=4..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"aqua"},{"text":"/","color":"gray"},{"text":"DEBUG","color":"aqua"},{"text":"]: ","color":"gray"},{"text":"Player ","color":"aqua"},{"selector":"@s","color":"gray"}, {"text":" kept from sleeping.","color":"aqua"}]

# Prevents sleeping in bed when activated
execute if score .prevent_sleep nadi.data matches 1 run tp @s ~ ~ ~

# Reset the advancement
advancement revoke @s only 2mal3:nadi/slept_in_bed
