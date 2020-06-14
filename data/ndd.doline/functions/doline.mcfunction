# Description: crate the doline
# Called from: ndd.doline:tick
# Datapack by 2mal3

# sound
playsound minecraft:entity.zombie.break_wooden_door master @a ~ ~ ~ 10


# move floor down
clone ~-5 ~-3 ~-5 ~5 ~5 ~5 ~-5 ~-4 ~-5 masked move


# destroyed hole
setblock ~-7 ~-1 ~-7 minecraft:structure_block[mode=load]{name:"ndd.doline:void",posY:0,rotation:"NONE",mirror:"NONE",mode:"LOAD",integrity: 0.7} replace
setblock ~-7 ~-1 ~-6 minecraft:redstone_block

setblock ~-7 ~-1 ~-7 minecraft:air
setblock ~-7 ~-1 ~-6 minecraft:air


# anti bug
tp @s ~ ~-1 ~
kill @e[type=minecraft:item,distance=..10]
