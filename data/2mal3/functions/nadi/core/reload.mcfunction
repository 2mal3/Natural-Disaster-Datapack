# Description: Commands when reloading the datapack
# AS: server, AT: server
# Called from function tag: load:post_load
# Datapack by 2mal3

# Output debug message in chat, if enabled (INFO)
tellraw @a[scores={nadi.debug_mode=3..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"green"},{"text":"/","color":"gray"},{"text":"INFO","color":"green"},{"text":"]: ","color":"gray"},{"text":"Datapack reloaded!","color":"green"}]


# Add basic scoreboards
scoreboard objectives add nadi.data dummy

# Initializes the datapack at the first startup or new version
execute unless score .first_run nadi.data matches 1 run function 2mal3:nadi/core/first_run/main
execute if score .first_run nadi.data matches 1 unless score $version nadi.data matches 020000 run function 2mal3:nadi/core/first_run/update


# Updates plugins and natural disasters
#declare storage 2mal3:nadi
data merge storage 2mal3:nadi {temp: {}, plugins: [], natural_disasters: []}
# Updated natural disasters
scoreboard players set $natural_disasters nadi.data 0
function #2mal3:nadi/register/natural_disasters
# Updated plugins
function #2mal3:nadi/register/plugins


# Starts the loop
schedule function 2mal3:nadi/core/loop 60s replace
