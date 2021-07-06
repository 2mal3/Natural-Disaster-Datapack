# Description: Prevents sleeping in bed when activated
# AS: player that trys to sleep in a bed, AT: @s
# Called from advancement: 2mal3:nadi/selpt_in_bed
# Datapck by 2mal3

tellraw @a[scores={nadi.debug_mode=4..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"aqua"},{"text":"/","color":"gray"},{"text":"DEBUG","color":"aqua"},{"text": "/","color": "gray"},{"selector":"@s", "color": "aqua"},{"text":"]: ","color":"gray"},{"text":"Player kept from sleeping","color":"aqua"}]
# Reset the advancement
advancement revoke @s only 2mal3:nadi/slept_in_bed

# Prevents sleeping in bed when activated
execute if score .prevent_sleep nadi.data matches 1 run tp @s ~ ~ ~
