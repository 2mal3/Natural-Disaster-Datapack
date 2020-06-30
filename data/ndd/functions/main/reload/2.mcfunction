# Description: Preparation commands if all verions are right
# Called from: ndd:main/reload/reload
# Datapack by 2mal3


# add system scoreboards
scoreboard objectives add ndd.data dummy
scoreboard players set V1 ndd.data 0
scoreboard players set V2 ndd.data 31
scoreboard players set V3 ndd.data 19


# send message
tellraw @a ["",{"text":"[Server] Natural Disaster Datapack v."},{"score":{"name":"V1","objective":"ndd.data"}},{"text":"."},{"score":{"name":"V2","objective":"ndd.data"}},{"text":"."},{"score":{"name":"V3","objective":"ndd.data"}},{"translate":" by 2mal3 was loaded!"}]


# add scoreboards
scoreboard objectives add ndd.config dummy

scoreboard objectives add ndd.infected_t dummy
scoreboard objectives add ndd.deathCount deathCount


# first datapack run
execute unless score ndd.first ndd.data matches 1 run function ndd:main/first

# load config
function ndd.config:config

# slow tick
schedule function ndd:main/tick_slow 1s


# improved meteroit 0.29.18
# better disease time 0.29.19
# improved debug 0.30.19
# little better config 0.30.20
# better hurricane 0.31.19
