# Description: uninstall
# Called from: ndd:main/uninstall/uninstall_ask
# Datapack by 2mal3

# ending natural diasaters
execute if score ndd.natural_disaster_on ndd.data matches 1 run function ndd:main/uninstall/uninstall_disasters


# remove scoreborads
scoreboard objectives remove ndd.data
scoreboard objectives remove ndd.config

scoreboard objectives remove ndd.infected_t
scoreboard objectives remove ndd.deathCount


# send uninstall message
tellraw @a ["",{"text":"[Server] Natural Disaster Datapack v."},{"score":{"name":"V1","objective":"ndd.data"}},{"text":"."},{"score":{"name":"V2","objective":"ndd.data"}},{"text":"."},{"score":{"name":"V3","objective":"ndd.data"}},{"translate":" by 2mal3 was successfully uninstalled."}]


# diable Datapack
datapack disable "file/Natural-Disaster-Datapack"
datapack disable "file/Natural-Disaster-Datapack.zip"
