# Description: uninstall
# Called from: nadi:main/uninstall/uninstall_ask
# Datapack by 2mal3

# ending natural diasaters
execute if score nadi.natural_disaster_on nadi.data matches 1 run function nadi:main/uninstall/uninstall_disasters

# send uninstall message
tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] ["",{"text":"[Server] Natural Disaster Datapack v."},{"score":{"name":"$V1","objective":"nadi.data"}},{"text":"."},{"score":{"name":"$V2","objective":"nadi.data"}},{"text":"."},{"score":{"name":"$V3","objective":"nadi.data"}},{"text":" by 2mal3 was successfully uninstalled."}]


# remove scoreborads
# system scoreboards
scoreboard objectives remove nadi.data
scoreboard objectives remove nadi.config
scoreboard objectives remove nadi.sound

# disease scoreboards
scoreboard objectives remove nadi.infected_t
scoreboard objectives remove nadi.deathCount


# remove volcanoes makers
kill @e[type=minecraft:armor_stand,tag=nadi.nadi.volcano]


# stop ticks
schedule clear nadi:main/tick/2second
schedule clear nadi:main/tick/second


# diable Datapack
datapack disable "file/Natural-Disaster-Datapack"
datapack disable "file/Natural-Disaster-Datapack.zip"
