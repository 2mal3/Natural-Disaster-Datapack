# Description: Creat a thunderstorm
# Called from: nadi:choose_disaster
# Datapack by 2mal3

# summon maker armor stand
execute as @r[limit=1,gamemode=!spectator,tag=!global.ignore] at @s run summon minecraft:armor_stand ~ ~ ~ {Invulnerable:1b,Invisible:1b,Motion:[0.0,-1.0,0.0],Tags:["nadi.doline","global.ignore"]}
playsound minecraft:ambient.cave master @a[tag=!global.ignore,tag=!global.ignore.gui] ~ ~ ~ 10

# send create mesage
execute if score $nadi.notifications_on nadi.config matches 1 run tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] {"translate":"A doline begins.","color":"gray"}

# scoreboards
scoreboard players operation $nadi.time nadi.data = $nadi.doline_time nadi.config
scoreboard players set $nadi.natural_disaster_on nadi.data 1

# some stuff for the api
function #nadi_api:doline_time

# starts the doline
schedule function nadi:natural_disasters/doline/tick 5s
