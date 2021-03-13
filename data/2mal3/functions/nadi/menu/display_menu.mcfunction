# Description: Open the core menu for datapack options
# Called from function tag: #2mal3:nadi/menu
# Datapack by 2mal3

# Disables command fedback for a short time, so that no disturbing message is displayed
gamerule sendCommandFeedback false
schedule function 2mal3:nadi/menu/send_command_feedback_true 1t

# Plays click sound
playsound minecraft:ui.button.click master @s


# Displays the text
tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
tellraw @s [{"text":"Natural Disaster Datapack v1.1.1","bold":true,"color":"yellow"},{"text":"\n--------------------------------","color":"yellow"}]

tellraw @s {"text":""}

tellraw @s {"text":"\u26a1 Manual start a natural disaster \u25b6","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/display_manual_start"},"hoverEvent":{"action":"show_text","contents":"*click*"}}
tellraw @s {"text":"\u2699 Configure Datapack \u25b6","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/display_config/page_1"},"hoverEvent":{"action":"show_text","contents":"*click*"}}
tellraw @s {"text":"\u303d Debug datapack \u25b6","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/core/debug"},"hoverEvent":{"action":"show_text","contents":"*click*"}}

tellraw @s {"text":""}

tellraw @s {"text":"\u2709 Datapack Wiki","color":"blue","clickEvent":{"action":"open_url","value":"https://github.com/2mal3/Natural-Disaster-Datapack/wiki"},"hoverEvent":{"action":"show_text","contents":"*click*"}}
tellraw @s {"text":"\u2b24 Datapack Website","color":"blue","clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/data-pack/natural-disaster-4574511/"},"hoverEvent":{"action":"show_text","contents":"*click*"}}
tellraw @s {"text":"\u231a Github Account","color":"blue","clickEvent":{"action":"open_url","value":"https://github.com/2mal3"},"hoverEvent":{"action":"show_text","contents":"*click*"}}

tellraw @s {"text":""}
tellraw @s {"text":"\u267b Uninstall the datapack \u25b6","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/core/uninstall/uninstall_ask"},"hoverEvent":{"action":"show_text","contents":"*click*"}}
