# Description: Determines the time until the next natural disaster after a natural disaster
# Called from: ndd...:remove
# Datapck by 2mal3

execute store result score ndd.time ndd.data run loot spawn ~ ~ ~ loot ndd:random_time
#tellraw @a {"score":{"name":"ndd.time","objective":"ndd.data"}}
