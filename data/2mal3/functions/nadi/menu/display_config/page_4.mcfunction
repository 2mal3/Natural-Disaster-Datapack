# Description: Open menu page 4 for configure the datapack
# Called from functions: 2mal3:nadi/menu/display_menu, 2mal3:nadi/menu/display_config
# Datapack by 2mal3

# Disables command fedback for a short time, so that no disturbing message is displayed
gamerule sendCommandFeedback false
schedule function 2mal3:nadi/menu/send_command_feedback_true 1t

# Plays click sound
playsound minecraft:ui.button.click master @s


### Display text
tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
tellraw @s [{"text":"Natural Disaster Config","bold":true,"color":"yellow"}]
tellraw @s [{"text":"<","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/display_config/page_3"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" --------- ","color":"yellow"},{"text":"[Refresh]","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/display_config/page_4"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" --------- ","color":"yellow"},{"text":">","color":"yellow"}]

tellraw @s {"text":""}

# volcano
execute if score $nadi.volcano_generate nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/volcano_generate/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Generate volcanoes","color":"gold","hoverEvent":{"action":"show_text","contents":"In newly generated areas can generate volcanoes."}}]
execute if score $nadi.volcano_generate nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/volcano_generate/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Generate volcanoes","color":"gold","hoverEvent":{"action":"show_text","contents":"In newly generated areas can generate volcanoes."}}]

execute if score $nadi.volcano_eruptions nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/volcano_eruptions/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Volcano eruptions","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of volcano eruptions."}}]
execute if score $nadi.volcano_eruptions nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/volcano_eruptions/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Volcano eruptions","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of volcano eruptions."}}]

tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n"}


tellraw @s {"text":"\u25c0 Go back","color":"red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/display_menu"},"hoverEvent":{"action":"show_text","contents":"*click*"}}