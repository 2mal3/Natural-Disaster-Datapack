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
tellraw @s [{"text":"<","color":"yellow"},{"text":" --------- ","color":"yellow"},{"text":"1 / 4","color":"gold"},{"text":" --------- ","color":"yellow"},{"text":">","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/display_config/page_2"},"hoverEvent":{"action":"show_text","contents":"*click*"}}]

tellraw @s {"text":""}

# Notifications
execute if score $nadi.notifications nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/notifications/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Natural disasters notifications","color":"gold","hoverEvent":{"action":"show_text","contents":"Messages are sent when a natural disaster begins or ends."}}]
execute if score $nadi.notifications nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/notifications/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Natural disasters notifications","color":"gold","hoverEvent":{"action":"show_text","contents":"Messages are sent when a natural disaster begins or ends."}}]

tellraw @s {"text":""}

# Time
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.time.min nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Minimum time: ","color":"gold","hoverEvent":{"action":"show_text","contents":"The minimum time between two natural disasters in minutes (default: 140)."}},{"score":{"name":"$nadi.time.min","objective":"nadi.config"},"color":"red"}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.time.max nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Maximum time: ","color":"gold","hoverEvent":{"action":"show_text","contents":"The maximum time between two natural disasters in minutes (default: 560)."}},{"score":{"name":"$nadi.time.max","objective":"nadi.config"},"color":"red"}]

tellraw @s {"text":""}

# Random natural disasters
execute if score $nadi.random_natural_disasters nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/random_natural_disasters/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Random natural disasters","color":"gold","hoverEvent":{"action":"show_text","contents":"After a random time, a random natural disaster is automatically started."}}]
execute if score $nadi.random_natural_disasters nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/random_natural_disasters/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Random natural disasters","color":"gold","hoverEvent":{"action":"show_text","contents":"After a random time, a random natural disaster is automatically started."}}]

tellraw @s {"text":""}

# Acid Rain
execute if score $nadi.acid_rain nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/acid_rain/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Acid Rain active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of acid rain."}}]
execute if score $nadi.acid_rain nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/acid_rain/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Acid Rain active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of acid rain."}}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.acid_rain.time nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Length of the acid rain: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Length of acid rain in minutes (default: 10)."}},{"score":{"name":"$nadi.acid_rain.time","objective":"nadi.config"},"color":"red"}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.acid_rain.anchor_entities nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Number of deleted blocks per second: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Number of blocks to be deleted per second by the acid rain (default: 2)."}},{"score":{"name":"$nadi.acid_rain.anchor_entities","objective":"nadi.config"},"color":"red"}]

tellraw @s {"text":""}

# Blizzard
execute if score $nadi.blizzard nadi.config matches 0 run tellraw @s [{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/blizzard/true"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Blizzard active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of blizzard."}}]
execute if score $nadi.blizzard nadi.config matches 1 run tellraw @s [{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/buttons/blizzard/false"},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Blizzard active","color":"gold","hoverEvent":{"action":"show_text","contents":"There is a possibility of blizzard."}}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.blizzard.time nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Length of the blizzard: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Length of blizzard in minutes (default: 10)."}},{"score":{"name":"$nadi.blizzard.time","objective":"nadi.config"},"color":"red"}]
tellraw @s [{"text":"[\u270e]","color":"gray","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.blizzard.anchor_entities nadi.config "},"hoverEvent":{"action":"show_text","contents":"*click*"}},{"text":" Snow count: ","color":"gold","hoverEvent":{"action":"show_text","contents":"Number of snowflakes that are created per second (default: 5)."}},{"score":{"name":"$nadi.blizzard.anchor_entities","objective":"nadi.config"},"color":"red"}]

tellraw @s {"text":""}


tellraw @s {"text":"\u25c0 Go back","color":"red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/display_menu"},"hoverEvent":{"action":"show_text","contents":"*click*"}}