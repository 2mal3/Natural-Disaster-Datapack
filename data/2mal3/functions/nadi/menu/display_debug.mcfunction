# Description: Open menu for configure the datapack
# Called from functions: 2mal3:nadi/menu/display_menu, 2mal3:nadi/menu/display_debug
# Datapack by 2mal3

# Disables command fedback for a short time, so that no disturbing message is displayed
gamerule sendCommandFeedback false
schedule function 2mal3:nadi/menu/send_command_feedback_true 1t

# Plays click sound
playsound minecraft:ui.button.click master @s


# Get variables
execute store result score $nadi.temp_0 nadi.data run data get entity @s DataVersion
execute store result score $nadi.temp_1 nadi.data run execute if entity @a


# Displays text
tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}

# nadi version; minecraft version; du version; player count; time; disaster on
tellraw @s [{"text":"Debug data: ","color":"gold"},{"score":{"name":"$nadi.version","objective":"nadi.data"},"color":"red"},{"text":"; ","color":"gold"},{"score":{"name":"$nadi.temp_0","objective":"nadi.data"},"color":"red"},{"text":"; ","color":"gold"},{"score":{"name":"$du.ver","objective":"load"},"color":"red"},{"text":"; ","color":"gold"},{"score":{"name":"$nadi.temp_1","objective":"nadi.data"},"color":"red"},{"text":"; ","color":"gold"},{"score":{"name":"$nadi.time","objective":"nadi.data"},"color":"red"},{"text":"; ","color":"gold"},{"score":{"name":"$nadi.natural_disaster_on","objective":"nadi.data"},"color":"red"}]

tellraw @s {"text":""}

tellraw @s {"text":"\u25c0 Go back","color":"red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/display_menu"},"hoverEvent":{"action":"show_text","contents":"*click*"}}