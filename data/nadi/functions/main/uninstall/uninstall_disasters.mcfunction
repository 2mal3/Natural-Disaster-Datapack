# Description: uninstall natural disaster prozesses
# Called from: nadi:main/uninstall/uninstall
# Datapack by 2mal3

execute if score $nadi.disaster nadi.data matches 2 run function nadi:natural_disasters/thunderstorm/remove
execute if score $nadi.disaster nadi.data matches 4 run function nadi:natural_disasters/hail/remove
execute if score $nadi.disaster nadi.data matches 5 run function nadi:natural_disasters/drought/remove
execute if score $nadi.disaster nadi.data matches 6 run function nadi:natural_disasters/firestorm/remove
execute if score $nadi.disaster nadi.data matches 7 run function nadi:natural_disasters/acid_rain/remove
execute if score $nadi.disaster nadi.data matches 8 run function nadi:natural_disasters/disease/remove
execute if score $nadi.disaster nadi.data matches 9 run function nadi:natural_disasters/hurricane/remove
execute if score $nadi.disaster nadi.data matches 10 run function nadi:natural_disasters/blizzard/remove
execute if score $nadi.disaster nadi.data matches 11 run function nadi:natural_disasters/sandstorm/remove

