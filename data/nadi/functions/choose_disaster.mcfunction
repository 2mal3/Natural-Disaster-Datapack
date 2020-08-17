# Description: chooses a random desaster and selects it
# Called from: nadi:main/tick
# Datapack by 2mal3

execute store result score $nadi.disaster nadi.data run loot spawn ~ ~ ~ loot nadi:nadi/random_disaster

execute if score $nadi.meteoroid nadi.config matches 1 if score $nadi.disaster nadi.data matches 1 run function nadi:natural_disasters/meteoroid/create.1
execute if score $nadi.thunderstorm nadi.config matches 1 if score $nadi.disaster nadi.data matches 2 run function nadi:natural_disasters/thunderstorm/create
execute if score $nadi.doline nadi.config matches 1 if score $nadi.disaster nadi.data matches 3 run function nadi:natural_disasters/doline/create
execute if score $nadi.hail nadi.config matches 1 if score $nadi.disaster nadi.data matches 4 run function nadi:natural_disasters/hail/create
execute if score $nadi.drought nadi.config matches 1 if score $nadi.disaster nadi.data matches 5 run function nadi:natural_disasters/drought/create
execute if score $nadi.firestorm nadi.config matches 1 if score $nadi.disaster nadi.data matches 6 run function nadi:natural_disasters/firestorm/create
execute if score $nadi.acid_rain nadi.config matches 1 if score $nadi.disaster nadi.data matches 7 run function nadi:natural_disasters/acid_rain/create
execute if score $nadi.disease nadi.config matches 1 if score $nadi.disaster nadi.data matches 8 run function nadi:natural_disasters/disease/create
execute if score $nadi.hurricane nadi.config matches 1 if score $nadi.disaster nadi.data matches 9 run function nadi:natural_disasters/hurricane/create
execute if score $nadi.blizzard nadi.config matches 1 if score $nadi.disaster nadi.data matches 10 run function nadi:natural_disasters/blizzard/create
execute if score $nadi.sandstorm nadi.config matches 1 if score $nadi.disaster nadi.data matches 11 run function nadi:natural_disasters/sandstorm/create
execute if score §nadi.volcano_eruptions nadi.config matches 1 if score $nadi.disaster nadi.data matches 12 run function nadi:natural_disasters/volcano/eruption/1

execute if score §nadi.natural_disaster_on nadi.data matches 0 run function nadi:choose_disaster