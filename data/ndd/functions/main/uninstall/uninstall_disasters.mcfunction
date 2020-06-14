# Description: uninstall natural disaster prozesses
# Called from: ndd:main/uninstall/uninstall
# Datapack by 2mal3

execute if score ndd.disaster ndd.data matches 2 run function ndd.thunderstorm:remove
execute if score ndd.disaster ndd.data matches 4 run function ndd.hail:remove
execute if score ndd.disaster ndd.data matches 5 run function ndd.drought:remove
execute if score ndd.disaster ndd.data matches 6 run function ndd.firestorm:remove
execute if score ndd.disaster ndd.data matches 7 run function ndd.acid_rain:remove
execute if score ndd.disaster ndd.data matches 8 run function ndd.disease:remove
execute if score ndd.disaster ndd.data matches 9 run function ndd.hurricane:remove
execute if score ndd.disaster ndd.data matches 10 run function ndd.blizzard:remove
execute if score ndd.disaster ndd.data matches 11 run function ndd.sandstorm:remove
