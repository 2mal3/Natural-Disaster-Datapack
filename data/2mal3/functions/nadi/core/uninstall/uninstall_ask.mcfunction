# Description: Ask the player if he really wants to uninstall the datapack
# Called from tag: 2mal3:nadi/uninstall
# Datapack by 2mal3

# Disables command fedback for a short time, so that no disturbing message is displayed
gamerule sendCommandFeedback false
schedule function 2mal3:nadi/menu/send_command_feedback_true 1t

# Plays click sound
playsound minecraft:ui.button.click master @s

# Asks the player
tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}

tellraw @s [{"text":"Do you really want to deinstall the Natural Disaster Datapack by 2mal3?","color":"red"},{"text":"\n"},{"text":"[No]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/display_menu"},"hoverEvent":{"action":"show_text","value":"*click*"}},{"text":"\u0020"},{"text":"[Yes]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/core/uninstall/uninstall"},"hoverEvent":{"action":"show_text","value":"*click*"}}]
