# Description: Open menu page 2 for configure the datapack
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
tellraw @s [{"text":"<","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/display_config/page_1"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" --------- ","color":"yellow"},{"text":"[Refresh]","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/display_config/page_2"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" --------- ","color":"yellow"},{"text":">","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/display_config/page_3"},"hoverEvent":{"action":"show_text","contents":"*click*"}}]

tellraw @s {"text":""}

# Drought
execute if score $nadi.drought nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/drought/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Drought active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of drought."}}]
execute if score $nadi.drought nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/drought/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Drought active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of drought."}}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.drought_time nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Length of the drought: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Length of drought in minutes (default: 10)."}},{"score":{"name":"$nadi.drought_time","objective":"nadi.config"},"color":"red"}]

tellraw @s {"text":""}

# Firestorm
execute if score $nadi.firestorm nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/firestorm/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Firestorm active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of firestorm."}}]
execute if score $nadi.firestorm nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/firestorm/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Firestorm active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of firestorm."}}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.firestorm_time nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Length of the firestorm: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Length of firestorm in minutes (default: 10)."}},{"score":{"name":"$nadi.firestorm_time","objective":"nadi.config"},"color":"red"}]

tellraw @s {"text":""}

# Hail
execute if score $nadi.hail nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/hail/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Hail active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of hail."}}]
execute if score $nadi.hail nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/hail/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Hail active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of hail."}}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.hail_time nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Length of the hail: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Length of hail in double seconds (default: 150)."}},{"score":{"name":"$nadi.hail_time","objective":"nadi.config"},"color":"red"}]

tellraw @s {"text":""}

# Hurricane
execute if score $nadi.hurricane nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/hurricane/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Hurricane active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of hurricane."}}]
execute if score $nadi.hurricane nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/hurricane/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Hurricane active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of hurricane."}}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.hurricane_time nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Length of the hurricane: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Length of hurricane in double ticks (default: 3000)."}},{"score":{"name":"$nadi.hurricane_time","objective":"nadi.config"},"color":"red"}]

tellraw @s {"text":""}

# Meteoroid
execute if score $nadi.meteoroid nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/meteoroid/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Meteoroid active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of meteoroid."}}]
execute if score $nadi.meteoroid nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/meteoroid/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Meteoroid active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of meteoroid."}}]

tellraw @s {"text":"\n\n"}


tellraw @s {"text":"\u25c0 Go back","color":"red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/display_menu"},"hoverEvent":{"action":"show_text","contents":"*click*"}}