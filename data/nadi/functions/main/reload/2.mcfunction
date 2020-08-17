# Description: Preparation commands if all verions are right
# Called from: nadi:main/reload/reload
# Datapack by 2mal3


# add system scoreboards
scoreboard objectives add nadi.data dummy
scoreboard players set $V1 nadi.data 1
scoreboard players set $V2 nadi.data 1
scoreboard players set $V3 nadi.data 0
scoreboard players set $nadi.version nadi.data 10100

# send reload message
tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] [{"text":"Natural Disaster Datapack v.","color":"blue"},{"score":{"name":"$V1","objective":"nadi.data"},"color":"blue"},{"text":".","color":"blue"},{"score":{"name":"$V2","objective":"nadi.data"},"color":"blue"},{"text":".","color":"blue"},{"score":{"name":"$V3","objective":"nadi.data"},"color":"blue"},{"text":" by 2mal3 was reloaded!","color":"blue"}]


# add scoreboards
scoreboard objectives add nadi.config dummy

# disease scoreboards
scoreboard objectives add nadi.infected_t dummy
scoreboard objectives add nadi.deathCount deathCount

# hurricane scoreboards
scoreboard objectives add nadi.sound dummy


# first datapack run
execute unless score $nadi.first nadi.data matches 1 run function nadi:main/first

# ticks
function nadi:main/tick/2second
function nadi:main/tick/second


# Updatet to 1.16
# Better Hurricane (new look, bug fixes and mechanics).
# New simple in game user interface (includes manual start of disasters, config, debugging and uninstall from datapack).
# Better particles in acid rain, blizzards and sandstorms.
# Sounds at volcanic eruptions, hurricanes, sandstorms and blizzards.
# Bug fixes.
# Improved performance.
# Better compatibility with other datapacks.
# Better and clearer code.
# Removed translation because not used.
# Removed low graphics mode.