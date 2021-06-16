# Description: Stop all natural disasters
# Called from function: -
# Datapack by 2mal3

# Disables command fedback for a short time, so that no disturbing message is displayed
gamerule sendCommandFeedback false
schedule function 2mal3:nadi/menu/send_command_feedback_true 1t
# Plays click sound
playsound minecraft:ui.button.click master @s

# Stop all natural disasters
function #2mal3:nadi/stop_natural_disasters
