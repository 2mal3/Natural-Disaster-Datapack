# Description: Move the anchor entity to the corner of the chunks
# AS: start anchor, AT: @s
# Called from: 2mal3:nadi/natural_disasters/drought/convert_blocks/summon/player
# Datapack by 2mal3

execute store result entity @s Pos[0] double 16 run data get entity @s Pos[0] 0.0625
execute store result entity @s Pos[2] double 16 run data get entity @s Pos[2] 0.0625

 
 