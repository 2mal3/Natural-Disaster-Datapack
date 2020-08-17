## All of these scores need to be set within the specified ranges.

# [0,3]: Size of structure. 0 = tiny (definitely less than 8x8, 4x4 prefered), 1 = small (less than 16x16), 2 = medium (less than 48x48), 3 = large (more than 48x48). This setting guarantees larger structures are more spread out.
scoreboard players set $world.in_0 du_data 2
# [1,1000]: Generation weight. When total weight < 1000 for all possible structures, this is the percent chance it will generate. Otherwise it is weight/total weight (Gen chance will always be <= specified weight).
scoreboard players set $world.in_1 du_data 500
# [0,1]: 1 = Ignore placement restrictions (prevents generation on water, sky, void, side of cliffs, etc). Useful if you want to generate somewhere other than the surface (ie. ocean, under ground, sky, etc.)
scoreboard players set $world.in_2 du_data 0
# [-1,1]: dimension ID
scoreboard players set $world.in_3 du_data 0


# Returns -1 if registering ore failed. Otherwise, returns generated structure registry ID.
function du:world/registry/register_struct
# Keep track of this number in a scoreboard value.
scoreboard players operation $nadi.volcano nadi.data = $world.out_0 du_data
