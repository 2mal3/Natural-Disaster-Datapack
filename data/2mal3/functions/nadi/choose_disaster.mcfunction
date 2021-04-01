# Description: chooses a random desaster and selects it
# Called from function: 2mal3:nadi/core/loops/minute
# Datapack by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"Randomly select a natural disaster ...","color":"green"}] 


# Generates a random number between 1 and 12
scoreboard players set .in_0 2mal3.random 0
scoreboard players set .in_1 2mal3.random 11
function 2mal3:random/random

# Starts a natural disaster depending on the random number
execute if score $nadi.meteoroid nadi.config matches 1 if score .out_0 2mal3.random matches 0 run function 2mal3:nadi/natural_disasters/meteoroid/create/create
execute if score $nadi.thunderstorm nadi.config matches 1 if score .out_0 2mal3.random matches 1 run function 2mal3:nadi/natural_disasters/thunderstorm/create
execute if score $nadi.doline nadi.config matches 1 if score .out_0 2mal3.random matches 2 run function 2mal3:nadi/natural_disasters/doline/create
execute if score $nadi.hail nadi.config matches 1 if score .out_0 2mal3.random matches 3 run function 2mal3:nadi/natural_disasters/hail/create
execute if score $nadi.drought nadi.config matches 1 if score .out_0 2mal3.random matches 4 run function 2mal3:nadi/natural_disasters/drought/create
execute if score $nadi.firestorm nadi.config matches 1 if score .out_0 2mal3.random matches 5 run function 2mal3:nadi/natural_disasters/firestorm/create
execute if score $nadi.acid_rain nadi.config matches 1 if score .out_0 2mal3.random matches 6 run function 2mal3:nadi/natural_disasters/acid_rain/create
execute if score $nadi.hurricane nadi.config matches 1 if score .out_0 2mal3.random matches 7 run function 2mal3:nadi/natural_disasters/hurricane/create
execute if score $nadi.blizzard nadi.config matches 1 if score .out_0 2mal3.random matches 8 run function 2mal3:nadi/natural_disasters/blizzard/create
execute if score $nadi.sandstorm nadi.config matches 1 if score .out_0 2mal3.random matches 9 run function 2mal3:nadi/natural_disasters/sandstorm/create
execute if score §nadi.volcano_eruptions nadi.config matches 1 if score .out_0 2mal3.random matches 10 run function 2mal3:nadi/natural_disasters/volcano/eruption/find

# Output debug message in chat, if enabled (WARN)
execute if score nadi.natural_disaster_on nadi.data matches 0 run tellraw @a[scores={nadi.debug_mode=2..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"gold"},{"text":"/","color":"gray"},{"text":"WARN","color":"gold"},{"text":"]: ","color":"gray"},{"text":"No natural disaster was triggered. Repeat procedure ...","color":"gold"}] 

# Repeats the procedure if no natural disaster was triggered
execute if score $nadi.natural_disaster_on nadi.data matches 0 run function 2mal3:nadi/choose_disaster
