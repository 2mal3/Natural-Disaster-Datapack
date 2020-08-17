# Description: crate the doline
# Called from: nadi:natural_disasters/doline/tick
# Datapack by 2mal3

# sound
playsound minecraft:entity.zombie.break_wooden_door master @a[tag=!global.ignore,tag=!global.ignore.gui] ~ ~ ~ 10


# move floor down
clone ~-5 ~-3 ~-5 ~5 ~5 ~5 ~-5 ~-4 ~-5 masked move


# make, that the corner of the hole look destroyed
setblock ~-7 ~-1 ~-7 minecraft:structure_block[mode=load]{name:"nadi:doline/void",posY:0,rotation:"NONE",mirror:"NONE",mode:"LOAD",integrity: 0.65f} replace
setblock ~-7 ~-1 ~-6 minecraft:redstone_block

setblock ~-7 ~-1 ~-7 minecraft:air
setblock ~-7 ~-1 ~-6 minecraft:air


# anti bug
tp @s ~ ~-1 ~
kill @e[type=minecraft:item,distance=..10]
