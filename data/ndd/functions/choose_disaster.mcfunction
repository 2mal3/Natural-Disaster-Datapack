# Description: chooses a random desaster and selects it
# Called from: ndd:main/tick
# Datapck by 2mal3

execute store result score ndd.disaster ndd.data run loot spawn ~ ~ ~ loot ndd:random_disaster

execute if score ndd.disaster ndd.data matches 1 run function ndd.meteoroid:summon
execute if score ndd.disaster ndd.data matches 2 run function ndd.thunderstorm:create
execute if score ndd.disaster ndd.data matches 3 run function ndd.doline:create
execute if score ndd.disaster ndd.data matches 4 run function ndd.hail:create
execute if score ndd.disaster ndd.data matches 5 run function ndd.drought:create
execute if score ndd.disaster ndd.data matches 6 run function ndd.firestorm:create
execute if score ndd.disaster ndd.data matches 7 run function ndd.acid_rain:create
execute if score ndd.disaster ndd.data matches 8 run function ndd.disease:create
execute if score ndd.disaster ndd.data matches 9 run function ndd.hurricane:create

#tellraw @a {"score":{"name":"ndd.time","objective":"ndd.data"}}
