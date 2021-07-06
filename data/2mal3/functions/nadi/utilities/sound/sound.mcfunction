# Description: Plays a wind sound
# AS: @a[tag=nadi.sound], AT: @s
# Called from function: 2mal3:nadi/utilities/sound/loop
# Datapack by 2mal3

tellraw @a[scores={nadi.debug_mode=4..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"aqua"},{"text":"/","color":"gray"},{"text":"DEBUG","color":"aqua"},{"text": "/","color": "gray"},{"selector":"@s", "color": "aqua"},{"text":"]: ","color":"gray"},{"text":"Play wind sound","color":"aqua"}]

# Plays the sound
playsound minecraft:item.elytra.flying ambient @s ~ ~ ~ 9999 0
# Resets the sound tag
tag @s remove nadi.sound
