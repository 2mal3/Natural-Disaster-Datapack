# Description: Starts a hurricane
# Called from function: 2mal3:nadi/choose_disaster
# Datapack by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"A hurricane is started.","color":"green"}]


# Sends a message to all players when enabled
execute if score $nadi.notifications nadi.config matches 1 run tellraw @a {"text":"A hurricane begins.","color":"gray"}

# Loads the time for the acid rain from the config
scoreboard players operation $nadi.time nadi.data = $nadi.hurricane.time nadi.config
# Saves that a natural disaster is active
scoreboard players set $nadi.natural_disaster_on nadi.data 1
# Saves that the bed can not be used
scoreboard players set $nadi.prevent_sleep nadi.data 1

# Sets the weather to endless thunder
weather thunder 99999
# Choose a random player for the hurricane and summon an ancor entity there
execute as @r[gamemode=!spectator,predicate=2mal3:nadi/in_overworld] at @s run summon minecraft:cow ~ 255 ~ {Silent: 1b, Invulnerable: 1b, PersistenceRequired: 1b, Tags: ["nadi.hurricane", "global.ignore"], ActiveEffects: [{Id: 14b, Amplifier: 1b, Duration: 99999, ShowParticles: 0b}], Attributes: [{Name: "generic.movement_speed", Base: 0.3d}]}

# Starts the loops
schedule function 2mal3:nadi/natural_disasters/hurricane/ticks/tick 1201t replace
schedule function 2mal3:nadi/natural_disasters/hurricane/ticks/second 61s replace
schedule function 2mal3:nadi/natural_disasters/hurricane/ticks/minute 120s replace

# Starts the sound library loop
function 2mal3:nadi/libraries/sound/loop

# Calls the corresponding function of the api
function #nadi_api:hurricane_time
