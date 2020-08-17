# Description: Determines the time until the next natural disaster after a natural disaster
# Called from: nadi:natural_disasters/...:remove
# Datapack by 2mal3

execute store result score $nadi.time nadi.data run loot spawn ~ ~ ~ loot nadi:nadi/random_time

function #nadi_api:new_time
