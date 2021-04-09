## All of these scores need to be set within the specified ranges.

# [0,3]: Size of structure. 0 = tiny (definitely less than 8x8, 4x4 prefered), 1 = small (less than 16x16), 2 = medium (less than 48x48), 3 = large (more than 48x48). This setting guarantees larger structures are more spread out.
scoreboard players set $world.in_0 du_data 2
# [1,1000]: Generation weight. When total weight < 1000 for all possible structures, this is the percent chance it will generate. Otherwise it is weight/total weight (Gen chance will always be <= specified weight).
scoreboard players set $world.in_1 du_data 300
# [0,3]: Placement scheme. 0 = surface, 1 = surface without restriction (ie. on liquids), 2 = cave, 3 = sky
scoreboard players set $world.in_2 du_data 0

# Optional: add this line to adjust dimension and/or biome whitelist/blacklist
# Defaults to overworld and no biome restrictions
# data merge storage du:temp {object:{dimension:"minecraft:overworld",biomes:["biome_1","biome_2",...],isBlacklist:0b}}

# Returns -1 if registering ore failed. Otherwise, returns generated structure registry ID.
function du:world/registry/register_struct
# Keep track of this number in a scoreboard value. 
scoreboard players operation $nadi.volcano nadi.data = $world.out_0 du_data