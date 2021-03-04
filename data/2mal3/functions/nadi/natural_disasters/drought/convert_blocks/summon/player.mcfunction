# Description: Creates anchor entitys at the corners of the surrounding chunks
# Called from: 2mal3:nadi/natural_disasters/drought/ticks/second
# Datapack by 2mal3

# Summon start anchor
summon minecraft:area_effect_cloud ~ ~ ~ {UUID: [I; -1787040053, -1718202825, -1827094430, 1148095174]}

# Move the anchor entity to the corner of the chunk
execute as 957beecb-9996-4e37-9318-c062446e8ac6 at @s run function 2mal3:nadi/natural_disasters/drought/convert_blocks/summon/corner
# Creates anchors in the surrounding chunks
execute as 957beecb-9996-4e37-9318-c062446e8ac6 at @s run function 2mal3:nadi/natural_disasters/drought/convert_blocks/summon/summon

# Deletes the start anchor
kill 957beecb-9996-4e37-9318-c062446e8ac6