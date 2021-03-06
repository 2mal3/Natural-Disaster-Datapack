# Description: Starts a drought
# AS: server, AT
# Called from function: 2mal3:nadi/choose_disaster
# Datapack by 2mal3

tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text": "/","color": "gray"},{"text":"Server", "color": "green"},{"text":"]: ","color":"gray"},{"text":"A drought is started","color":"green"}]


# Sends a message to all players when enabled
execute if score $notifications nadi.config matches 1 run tellraw @a {"text":"A drought begins.","color":"gray"}

# Loads the time for the acid rain from the config
scoreboard players operation .time nadi.data = $drought.time nadi.config
# Saves that a natural disaster is active
scoreboard players set .natural_disaster_on nadi.data 1

# Starts the loops
schedule function 2mal3:nadi/natural_disasters/drought/ticks/tick 1201t replace
schedule function 2mal3:nadi/natural_disasters/drought/ticks/second 61s replace
schedule function 2mal3:nadi/natural_disasters/drought/ticks/minute 120s replace

# Sets the radom tick speed for the time of drought to 1
gamerule randomTickSpeed 1
# Deletes all old drought maker entities
kill @e[type=minecraft:area_effect_cloud,tag=nadi.drought_converted]


# Calls a function from the api to modify the natural disaster
function #nadi_api:drought_time
