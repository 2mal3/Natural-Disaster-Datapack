# Description: Starts a doline
# AS: server, AT: server
# Called from function: 2mal3:nadi/choose_disaster
# Datapack by 2mal3

tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text": "/","color": "gray"},{"text":"Server", "color": "green"},{"text":"]: ","color":"gray"},{"text":"A doline is started","color":"green"}]


# Sends a message to all players when enabled
execute if score $notifications nadi.config matches 1 run tellraw @a {"text":"A doline begins.","color":"gray"}

# Loads the time for the doline from the config
scoreboard players operation .time nadi.data = $doline.time nadi.config
# Saves that a natural disaster is active
scoreboard players set .natural_disaster_on nadi.data 1


# Creates an anchor antity at a random player
execute as @r[limit=1,gamemode=!spectator,tag=!global.ignore,predicate=2mal3:nadi/in_overworld] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Age: -2147483648, Duration: -1, WaitTime: -2147483648, Tags: ["nadi.doline", "global.ignore"]}
# Plays a cave sound at the anchor
execute as @e[type=minecraft:area_effect_cloud,tag=nadi.doline] at @s run playsound minecraft:ambient.cave ambient @a ~ ~ ~ 10

# Starts the doline in 5 seconds
schedule function 2mal3:nadi/natural_disasters/doline/tick 5s replace

# Calls a function from the api to modify the natural disaster
function #nadi_api:doline_time
