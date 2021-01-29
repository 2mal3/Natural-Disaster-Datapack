# Description: collecting debug infos
# Called from: #debug
# Datapack by 2mal3

tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text":""}
tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text":"Collecting Infos ...","color":"gray"}

execute store result score $nadi.temp_0 nadi.data run data get entity @s DataVersion
scoreboard players operation $nadi.temp_1 nadi.data = $nadi.time nadi.data

tag @s[tag=!global.ignore,tag=!global.ignore.gui] add nadi.debug
schedule function 2mal3:nadi/debug/2 3s
