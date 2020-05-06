# Description: Created a meteroite that falls to the earth
# Called from: ndd:choose_disaster
# Datapck by 2mal3

execute as @r[gamemode=!spectator] at @s run summon minecraft:fireball ~ 300 ~ {ExplosionPower:150,direction:[0.0,0.0,0.0],power:[0.0,-0.4,0.0],Tags:["ndd.meteoroid.1"]}
execute as @e[tag=ndd.meteoroid.1] at @s run summon minecraft:armor_stand ~ ~ ~ {Invulnerable:1b,PersistenceRequired:1b,Tags:["ndd.meteoroid.2"]}

say meteoroid
schedule function ndd:natural_disaster/meteoroid/place 15s
function ndd:new_time
