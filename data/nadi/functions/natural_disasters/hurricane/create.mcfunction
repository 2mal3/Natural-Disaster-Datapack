# Description: Creat a hurricane
# Called from: nadi:choose_disaster
# Datapack by 2mal3

# send create message
execute if score $nadi.notifications_on nadi.config matches 1 run tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] {"translate":"A hurricane begins.","color":"gray"}

# set the weather to thunder
weather thunder 99999

# choose a random player for the hurricane and summon an ancor entity there
execute as @r[gamemode=!spectator,limit=1,tag=!global.ignore] at @s run summon minecraft:pig ~ 300 ~ {Silent:1b,Invulnerable:1b,Motion:[0.0,-5.0,0.0],PersistenceRequired:1b,Tags:["nadi.hurricane","global.ignore"],ActiveEffects:[{Id:14b,Amplifier:1b,Duration:99999,ShowParticles:0b}],Attributes:[{Name:"generic.movement_speed",Base:0.1}]}


# load hurricane time
scoreboard players operation $nadi.time nadi.data = $nadi.hurricane_time nadi.config
scoreboard players set $nadi.natural_disaster_on nadi.data 1

# some stuff for the api
function #nadi_api:hurricane_time

# start hurricane
schedule function nadi:natural_disasters/hurricane/tick 10s
