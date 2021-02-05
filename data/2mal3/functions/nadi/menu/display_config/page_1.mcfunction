# Description: Open menu page 1 for configure the datapack
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
tellraw @s [{"text":"<","color":"yellow"},{"text":" --------- ","color":"yellow"},{"text":"[Refresh]","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/display_config/page_1"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" --------- ","color":"yellow"},{"text":">","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/display_config/page_2"},"hoverEvent":{"action":"show_text","contents":"*click*"}}]

tellraw @s {"text":""}

# Notifications
execute if score $nadi.notifications_on nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/notifications/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Natural disasters notifications","color":"gold","hoverEvent":{"action":"show_text","contents":"Messages are sent when a natural disaster begins or ends."}}]
execute if score $nadi.notifications_on nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/notifications/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Natural disasters notifications","color":"gold","hoverEvent":{"action":"show_text","contents":"Messages are sent when a natural disaster begins or ends."}}]

tellraw @s {"text":""}

# Time
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.time.min nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Minimum time: ","color":"gold","hoverEvent":{"action":"show_text","contents":"The minimum time between two natural disasters in minutes (default: 140)."}},{"score":{"name":"$nadi.time.min","objective":"nadi.config"},"color":"red"}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.time.max nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Maximum time: ","color":"gold","hoverEvent":{"action":"show_text","contents":"The maximum time between two natural disasters in minutes (default: 560)."}},{"score":{"name":"$nadi.time.max","objective":"nadi.config"},"color":"red"}]

tellraw @s {"text":""}

# Acid Rain
execute if score $nadi.acid_rain nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/acid_rain/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Acid Rain active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of acid rain."}}]
execute if score $nadi.acid_rain nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/acid_rain/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Acid Rain active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of acid rain."}}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.acid_rain_time nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Length of the acid rain: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Length of acid rain in double seconds (default: 150)."}},{"score":{"name":"$nadi.acid_rain_time","objective":"nadi.config"},"color":"red"}]

tellraw @s {"text":""}

# Blizzard
execute if score $nadi.blizzard nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/blizzard/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Blizzard active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of blizzard."}}]
execute if score $nadi.blizzard nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/blizzard/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Blizzard active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of blizzard."}}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.blizzard_time nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Length of the blizzard: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Length of blizzard in seconds (default: 300)."}},{"score":{"name":"$nadi.blizzard_time","objective":"nadi.config"},"color":"red"}]

tellraw @s {"text":""}

# Disease
execute if score $nadi.disease nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/disease/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Disease active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of disease."}}]
execute if score $nadi.disease nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/disease/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Disease active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of disease."}}]

tellraw @s {"text":""}

# Doline
execute if score $nadi.doline nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/doline/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Doline active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of doline."}}]
execute if score $nadi.doline nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/doline/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Doline active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of doline."}}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.doline_time nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Depth of the doline: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Depth of doline in blocks (default: 30)."}},{"score":{"name":"$nadi.doline_time","objective":"nadi.config"},"color":"red"}]

tellraw @s {"text":""}


tellraw @s {"text":"\u25c0 Go back","color":"red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/display_menu"},"hoverEvent":{"action":"show_text","contents":"*click*"}}