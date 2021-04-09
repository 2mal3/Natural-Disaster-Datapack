# Description: Shows all installed plugins
# AS: player, AT: player
# Called from function: 2mal3:nadi/menu/display_menu
# Datapack by 2mal3

# Disables command fedback for a short time, so that no disturbing message is displayed
gamerule sendCommandFeedback false
schedule function 2mal3:nadi/menu/send_command_feedback_true 1t
# Plays click sound
playsound minecraft:ui.button.click master @s


# Displays the plugins
tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
tellraw @s [{"text":"Natural Disaster Plugins","bold":true,"color":"yellow"},{"text":"\n--------------------------------\n","color":"yellow"}]

data modify storage 2mal3:nadi temp set from storage 2mal3:nadi plugins
function 2mal3:nadi/menu/list_plugins/loop

# End
tellraw @s {"text":""}
tellraw @s {"text":"\u25c0 Go back","color":"red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/display_menu"},"hoverEvent":{"action":"show_text","contents":"*click*"}}
