# Description: Plays a wind sound
# AS: @a[tag=nadi.sound], AT: @s
# Called from function: 2mal3:nadi/utilities/sound/loop
# Datapack by 2mal3

# Plays the sound
playsound minecraft:item.elytra.flying ambient @s ~ ~ ~ 9999 0
# Resets the sound tag
tag @s remove nadi.sound
