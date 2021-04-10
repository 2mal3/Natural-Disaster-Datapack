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
tellraw @s [{"text":"<","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/display_config/page_1"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" --------- ","color":"yellow"},{"text":"2 / 4","color":"gold"},{"text":" --------- ","color":"yellow"},{"text":">","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/display_config/page_3"},"hoverEvent":{"action":"show_text","contents":"*click*"}}]
tellraw @s {"text":""}

# Doline
execute if score $doline nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/doline/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Doline active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of doline."}}]
execute if score $doline nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/doline/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Doline active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of doline."}}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $doline.time nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Depth of the doline: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Depth of doline in blocks (default: 30)."}},{"score":{"name":"$doline.time","objective":"nadi.config"},"color":"red"}]

tellraw @s {"text":""}

# Drought
execute if score $drought nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/drought/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Drought active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of drought."}}]
execute if score $drought nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/drought/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Drought active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of drought."}}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $drought.time nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Length of the drought: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Length of drought in minutes (default: 10)."}},{"score":{"name":"$drought.time","objective":"nadi.config"},"color":"red"}]

tellraw @s {"text":""}

# Firestorm
execute if score $firestorm nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/firestorm/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Firestorm active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of firestorm."}}]
execute if score $firestorm nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/firestorm/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Firestorm active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of firestorm."}}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $firestorm.time nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Length of the firestorm: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Length of firestorm in minutes (default: 10)."}},{"score":{"name":"$firestorm.time","objective":"nadi.config"},"color":"red"}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $firestorm.anchor_entities nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Fire count: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Number of new fires created per second (default: 10)."}},{"score":{"name":"$firestorm.anchor_entities","objective":"nadi.config"},"color":"red"}]

tellraw @s {"text":""}

# Hail
execute if score $hail nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/hail/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Hail active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of hail."}}]
execute if score $hail nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/hail/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Hail active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of hail."}}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $hail.time nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Length of the hail: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Length of hail in minutes (default: 10)."}},{"score":{"name":"$hail.time","objective":"nadi.config"},"color":"red"}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $hail.anchor_entities nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Hail count: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Number of new hailstones created per second (default: 5)."}},{"score":{"name":"$hail.anchor_entities","objective":"nadi.config"},"color":"red"}]

tellraw @s {"text":"\n"}


tellraw @s {"text":"\u25c0 Go back","color":"red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/display_menu"},"hoverEvent":{"action":"show_text","contents":"*click*"}}
