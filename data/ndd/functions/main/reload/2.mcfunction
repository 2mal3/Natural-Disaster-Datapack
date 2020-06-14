# Description: Preparation commands if all verions are right
# Called from: ndd:main/reload/reload
# Datapack by 2mal3


# add system scoreboards
scoreboard objectives add ndd.data dummy
scoreboard players set V1 ndd.data 0
scoreboard players set V2 ndd.data 28
scoreboard players set V3 ndd.data 18


# send message
tellraw @a ["",{"text":"[Server] Natural Disaster Datapack v."},{"score":{"name":"V1","objective":"ndd.data"}},{"text":"."},{"score":{"name":"V2","objective":"ndd.data"}},{"text":"."},{"score":{"name":"V3","objective":"ndd.data"}},{"translate":" by 2mal3 was loaded!"}]


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


# improved hurricane 0.21.17
# A little better code 0.21.18
# more api technikes 0.22.18
# language support for install and uninstall 0.23.18
# using the du api 0.24.18
# adden vulcan 0.25.18
# improved doline 0.26.18
# better uninstall 0.27.18
# better load 0.28.18
