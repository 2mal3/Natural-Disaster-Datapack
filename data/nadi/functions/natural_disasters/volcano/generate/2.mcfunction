# Description: generates the volcano
# Called from: nadi:natural_disasters/volcano/generate/1
# Datapack by 2mal3

setblock ~ ~-6 ~ structure_block[mode=load]{name:"nadi:volcano/volcano",posY:0,rotation:"NONE",mirror:"NONE",mode:"LOAD"}
setblock ~ ~-5 ~ minecraft:redstone_block
summon minecraft:armor_stand ~16 ~26 ~16 {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["nadi.volcano","global.ignore"]}
