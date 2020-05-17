# Description: uninstall
# Called from: ndd:main/uninstall/uninstall_ask
# Datapck by 2mal3

# send uninstall message
tellraw @a ["",{"text":"[Server] The Natural Disaster Datapack v."},{"score":{"name":"V1","objective":"ndd.data"}},{"text":"."},{"score":{"name":"V2","objective":"ndd.data"}},{"text":"."},{"score":{"name":"V3","objective":"ndd.data"}},{"text":" by 2mal3 was successfully uninstalled."}]

# remove scoreborads
scoreboard objectives remove ndd.data
scoreboard objectives remove ndd.config
scoreboard objectives remove ndd.infected_t
scoreboard objectives remove ndd.deathCount

# diable Datapack
datapack disable "file/Natural-Disaster-Datapack"
