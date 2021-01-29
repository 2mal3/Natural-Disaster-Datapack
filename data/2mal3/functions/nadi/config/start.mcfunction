# Description: Init the config menu
# Called from: 2mal3:nadi/core/tick
# Datapack by 2mal3

# print start message
tellraw @s[tag=!global.ignore,tag=!global.ignore.gui] {"text":"Start config menu ...","italic":true,"color":"gray"}

# set start page
scoreboard players set @s[tag=!global.ignore] nadi.data 1

# other
tag @s[tag=!global.ignore] add nadi.config

# disables command feedback temporatly
execute store result score $nadi.command_feedback nadi.data run gamerule sendCommandFeedback
execute if score $nadi.command_feedback nadi.data matches 1 run gamerule sendCommandFeedback false
