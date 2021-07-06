# Description: "dries out" all blocks of the chunk from 32 to 192 blocks
# AS: erver chunk anchor, AT: @s
# Called from: 2mal3:nadi/natural_disasters/drought/ticks/second
# Datapack by 2mal3

# "dries out"
fill ~ ~ ~ ~16 ~96 ~16 minecraft:air replace #2mal3:nadi/drought_remove
fill ~ ~ ~ ~16 ~96 ~16 minecraft:dead_bush replace #minecraft:flowers
fill ~ ~ ~ ~16 ~96 ~16 minecraft:sand replace minecraft:grass_block
fill ~ ~ ~ ~16 ~96 ~16 minecraft:sandstone replace minecraft:dirt
fill ~ ~ ~ ~16 ~96 ~16 minecraft:sandstone replace minecraft:coarse_dirt

fill ~ ~96 ~ ~16 ~160 ~16 minecraft:air replace #2mal3:nadi/drought_remove
fill ~ ~96 ~ ~16 ~160 ~16 minecraft:dead_bush replace #minecraft:flowers
fill ~ ~96 ~ ~16 ~160 ~16 minecraft:sand replace minecraft:grass_block
fill ~ ~96 ~ ~16 ~160 ~16 minecraft:sandstone replace minecraft:dirt
fill ~ ~96 ~ ~16 ~160 ~16 minecraft:sandstone replace minecraft:coarse_dirt


# Saves that the chunk has been converted
summon minecraft:area_effect_cloud ~ ~ ~ {Duration: 1200, Tags: ["nadi.drought_converted", "global.ignore"]}
