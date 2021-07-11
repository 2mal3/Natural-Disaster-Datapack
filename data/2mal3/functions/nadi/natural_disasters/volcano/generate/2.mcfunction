# Description: Generates the volcano
# Called from function: 2mal3:nadi/natural_disasters/volcano/generate/1
# Datapack by 2mal3

setblock ~ ~-6 ~ structure_block[mode=load]{name: "2mal3:nadi/volcano", posY: 0, rotation: "NONE", mirror: "NONE", mode: "LOAD"}
setblock ~ ~-5 ~ minecraft:redstone_block
summon minecraft:marker ~16 ~26 ~16 {Tags: ["nadi.volcano", "global.ignore"]}
