# Description: Preparation commands
# Called from: #reaload
# Datapack by 2mal3


# add system scoreboards
scoreboard objectives add ndd.data dummy
scoreboard players set V1 ndd.data 0
scoreboard players set V2 ndd.data 20
scoreboard players set V3 ndd.data 13


# send message
tellraw @a ["",{"text":"[Server] Natural Disaster Datapack v."},{"score":{"name":"V1","objective":"ndd.data"}},{"text":"."},{"score":{"name":"V2","objective":"ndd.data"}},{"text":"."},{"score":{"name":"V3","objective":"ndd.data"}},{"text":" by 2mal3 was loaded!"}]


# add scoreboards
scoreboard objectives add ndd.config dummy

scoreboard objectives add ndd.infected_t dummy
scoreboard objectives add ndd.deathCount deathCount


# first datapack run
execute unless score ndd.first ndd.data matches 1 run function ndd:main/first

# load config
function ndd:config

# slow tick
schedule function ndd:main/tick_slow 1s


# better performance 0.17.13
# The occurrence of natural disasters can now be changed in the settings. 0.18.13
# low grapics mode 0.19.13
# language support 0.20.13
