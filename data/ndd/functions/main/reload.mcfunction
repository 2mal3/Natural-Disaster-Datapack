# Description: Preparation commands
# Called from: #reaload
# Datapack by 2mal3


# add system scoreboards
scoreboard objectives add ndd.data dummy
scoreboard players set V1 ndd.data 0
scoreboard players set V2 ndd.data 17
scoreboard players set V3 ndd.data 12


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


# added sandstorm 0.16.10
# better performance 0.16.11
# improved blizzard 0.16.12
# api for new desaster time 0.17.12
