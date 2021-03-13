# Description: Open menu page 3 for configure the datapack
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
tellraw @s [{"text":"<","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/display_config/page_2"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" --------- ","color":"yellow"},{"text":"3 / 4","color":"gold"},{"text":" --------- ","color":"yellow"},{"text":">","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/display_config/page_4"},"hoverEvent":{"action":"show_text","contents":"*click*"}}]


tellraw @s {"text":""}

# Hurricane
execute if score $nadi.hurricane nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/hurricane/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Hurricane active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of hurricane."}}]
execute if score $nadi.hurricane nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/hurricane/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Hurricane active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of hurricane."}}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.hurricane.time nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Length of the hurricane: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Length of hurricane in minutes (default: 10)."}},{"score":{"name":"$nadi.hurricane.time","objective":"nadi.config"},"color":"red"}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.hurricane.anchor_entities nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Number of blocks destroyed: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Number of blocks that are picked up by the hurricane with a certain probability per tick (default: 2)."}},{"score":{"name":"$nadi.hurricane.anchor_entities","objective":"nadi.config"},"color":"red"}]

tellraw @s {"text":""}

# Meteoroid
execute if score $nadi.meteoroid nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/meteoroid/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Meteoroid active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of meteoroid."}}]
execute if score $nadi.meteoroid nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/meteoroid/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Meteoroid active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of meteoroid."}}]

tellraw @s {"text":""}

# Sandstorm
execute if score $nadi.sandstorm nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/sandstorm/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Sandstorm active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of sandstorm."}}]
execute if score $nadi.sandstorm nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/sandstorm/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Sandstorm active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of sandstorm."}}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.sandstorm.time nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Length of the sandstorm: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Length of sandstorm in minutes (default: 10)."}},{"score":{"name":"$nadi.sandstorm.time","objective":"nadi.config"},"color":"red"}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.sandstorm.anchor_entities nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Sand count: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Number of new sand created per second (default: 2)."}},{"score":{"name":"$nadi.sandstorm.anchor_entities","objective":"nadi.config"},"color":"red"}]

tellraw @s {"text":""}

# Thunderstorm
execute if score $nadi.thunderstorm nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/thunderstorm/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Thunderstorm active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of thunderstorm."}}]
execute if score $nadi.thunderstorm nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/thunderstorm/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Thunderstorm active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of thunderstorm."}}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.thunderstorm.time nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Length of the thunderstorm: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Length of thunderstorm in in seconds * 5 (default: 150)."}},{"score":{"name":"$nadi.thunderstorm.time","objective":"nadi.config"},"color":"red"}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.sandstorm.anchor_entities nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Lightning bolt count: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Number of lightning bolt created per second (default: 1)."}},{"score":{"name":"$nadi.sandstorm.anchor_entities","objective":"nadi.config"},"color":"red"}]

tellraw @s {"text":"\n"}


tellraw @s {"text":"\u25c0 Go back","color":"red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/display_menu"},"hoverEvent":{"action":"show_text","contents":"*click*"}}