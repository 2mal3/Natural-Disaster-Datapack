# Description: Open menu page 3 for configure the datapack
# Called from functions: 2mal3:nadi/menu/display_menu, 2mal3:nadi/menu/display_config
# Datapack by 2mal3

# Disables command fedback for a short time, so that no disturbing message is displayed
gamerule sendCommandFeedback false
schedule function 2mal3:nadi/menu/send_command_feedback_true 1t
# Plays click sound
playsound minecraft:ui.button.click master @s


# Display text
tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
tellraw @s [{"text":"Natural Disaster Config","bold":true,"color":"yellow"}]
tellraw @s [{"text":"<","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/display_config/page_2"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" --------- ","color":"yellow"},{"text":"3 / 3","color":"gold"},{"text":" --------- ","color":"yellow"},{"text":">","color":"yellow"}]
tellraw @s {"text":""}

# Meteoroid
#execute if score $meteoroid nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/meteoroid/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Meteoroid active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of meteoroid."}}]
#execute if score $meteoroid nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/meteoroid/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Meteoroid active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of meteoroid."}}]

#tellraw @s {"text":""}

# Sandstorm
#execute if score $sandstorm nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/sandstorm/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Sandstorm active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of sandstorm."}}]
#execute if score $sandstorm nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/sandstorm/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Sandstorm active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of sandstorm."}}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $sandstorm.time nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Length of the sandstorm: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Length of sandstorm in minutes (default: 10)."}},{"score":{"name":"$sandstorm.time","objective":"nadi.config"},"color":"red"}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $sandstorm.anchor_entities nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Sand count: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Number of new sand created per second (default: 2)."}},{"score":{"name":"$sandstorm.anchor_entities","objective":"nadi.config"},"color":"red"}]

tellraw @s {"text":""}

# Thunderstorm
#execute if score $thunderstorm nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/thunderstorm/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Thunderstorm active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of thunderstorm."}}]
#execute if score $thunderstorm nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/thunderstorm/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Thunderstorm active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of thunderstorm."}}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $thunderstorm.time nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Length of the thunderstorm: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Length of thunderstorm in in seconds * 5 (default: 150)."}},{"score":{"name":"$thunderstorm.time","objective":"nadi.config"},"color":"red"}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $sandstorm.anchor_entities nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Lightning bolt count: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Number of lightning bolt created per second (default: 1)."}},{"score":{"name":"$sandstorm.anchor_entities","objective":"nadi.config"},"color":"red"}]

tellraw @s {"text":""}

# volcano
execute if score $volcano_generate nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/volcano_generate/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Generate volcanoes","color":"gold","hoverEvent":{"action":"show_text","contents":"In newly generated areas can generate volcanoes."}}]
execute if score $volcano_generate nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/volcano_generate/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Generate volcanoes","color":"gold","hoverEvent":{"action":"show_text","contents":"In newly generated areas can generate volcanoes."}}]
#execute if score $volcano_eruptions nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/volcano_eruptions/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Volcano eruptions","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of volcano eruptions."}}]
#execute if score $volcano_eruptions nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/volcano_eruptions/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Volcano eruptions","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of volcano eruptions."}}]


tellraw @s {"text":"\n\n\n\n\n\n"}

tellraw @s {"text":"\u25c0 Go back","color":"red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/display_menu"},"hoverEvent":{"action":"show_text","contents":"*click*"}}
tellraw @s {"text":""}
