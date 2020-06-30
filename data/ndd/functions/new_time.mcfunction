# Description: Determines the time until the next natural disaster after a natural disaster
# Called from: ndd...:remove
# Datapack by 2mal3

execute store result score ndd.time ndd.data run loot spawn ~ ~ ~ loot ndd.config:random_time

function #ndd_api:new_time
