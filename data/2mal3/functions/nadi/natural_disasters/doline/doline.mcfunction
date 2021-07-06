# Description: Moves the bottom of the doline down one block
# AS: @e[type=minecraft:area_effect_cloud,tag=nadi.doline], AT: @s
# Called from function: 2mal3:nadi/natural_disasters/doline/tick
# Datapack by 2mal3

# Plays a breaking sound to all close players
playsound minecraft:entity.zombie.break_wooden_door master @a[tag=!global.ignore,tag=!global.ignore.gui] ~ ~ ~ 10

# Moves the floor down one block
clone ~-5 ~-3 ~-5 ~5 ~5 ~5 ~-5 ~-4 ~-5 masked move

# Damage the edge of the doline to make it look more natural
setblock ~-7 ~-1 ~-7 minecraft:structure_block[mode=load]{name: "2mal3:nadi/doline/void", posY: 0, rotation: "NONE", mirror: "NONE", mode: "LOAD", integrity: 0.6f} replace
setblock ~-7 ~-1 ~-6 minecraft:redstone_block
setblock ~-7 ~-1 ~-7 minecraft:air
setblock ~-7 ~-1 ~-6 minecraft:air

# Teleports the anchor down one block
tp @s ~ ~-1 ~

# Deletes all unwanted created items
kill @e[type=minecraft:item,distance=..10]
