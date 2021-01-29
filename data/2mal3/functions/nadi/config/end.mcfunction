# Description: Ends the config menu
# Called from: 2mal3:nadi/core/tick
# Datapack by 2mal3

tellraw @s {"text":"Config saved!","italic":true,"color":"gray"}

# reset
tag @s remove nadi.config
scoreboard players reset @s bad.data

# enable command feedback if its was enabled
execute if score $nadi.command_feedback nadi.data matches 1 run gamerule sendCommandFeedback true
