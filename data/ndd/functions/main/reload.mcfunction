# Description: Preparation commands
# Called from: #reaload
# Datapck by 2mal3


# add system scoreboards
scoreboard objectives add ndd.data dummy
scoreboard players set V1 ndd.data 0
scoreboard players set V2 ndd.data 8
scoreboard players set V3 ndd.data 2

# send message
tellraw @a ["",{"text":"[Server] Natural Disaster Datapack v."},{"score":{"name":"V1","objective":"ndd.data"}},{"text":"."},{"score":{"name":"V2","objective":"ndd.data"}},{"text":"."},{"score":{"name":"V3","objective":"ndd.data"}},{"text":" by 2mal3 was loaded!"}]


# add scoreboards
scoreboard objectives add ndd.config dummy
scoreboard objectives add ndd.infected_t dummy
scoreboard objectives add ndd.deathCount deathCount


# first datapack run
execute unless score ndd.first ndd.data matches 1 run function ndd:main/first


# slow tick
schedule function ndd:main/tick_slow 1s



### To Do ####
# meteroid einschlagswinkel
# doline kaputtes loch
# config
# scoreboards
# übersetztung
# balanc
