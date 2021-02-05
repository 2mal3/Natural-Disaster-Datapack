# Description: Open menu for manual start natural disasters
# Called from function: 2mal3:nadi/menu/display_menu
# Datapack by 2mal3

# Disables command fedback for a short time, so that no disturbing message is displayed
gamerule sendCommandFeedback false
schedule function 2mal3:nadi/menu/send_command_feedback_true 1t

# Plays click sound
playsound minecraft:ui.button.click master @s


# Displays the text
tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}

tellraw @s [{"text":"Natural Disaster Datapack v1.1.1","bold":true,"color":"yellow"},{"text":"\n--------------------------------\n","color":"yellow"}]

tellraw @s {"text":"Acid Rain \u25b6","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/natural_disasters/acid_rain/create"},"hoverEvent":{"action":"show_text","value":"*click*"}}
tellraw @s {"text":"Blizzard \u25b6","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/natural_disasters/blizzard/create"},"hoverEvent":{"action":"show_text","value":"*click*"}}
tellraw @s {"text":"Disease \u25b6","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/natural_disasters/disease/create"},"hoverEvent":{"action":"show_text","value":"*click*"}}
tellraw @s {"text":"Doline \u25b6","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/natural_disasters/doline/create"},"hoverEvent":{"action":"show_text","value":"*click*"}}
tellraw @s {"text":"Drought \u25b6","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/natural_disasters/drought/create"},"hoverEvent":{"action":"show_text","value":"*click*"}}
tellraw @s {"text":"Firestorm \u25b6","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/natural_disasters/firestorm/create"},"hoverEvent":{"action":"show_text","value":"*click*"}}
tellraw @s {"text":"Hail \u25b6","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/natural_disasters/hail/create"},"hoverEvent":{"action":"show_text","value":"*click*"}}
tellraw @s {"text":"Hurricane \u25b6","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/natural_disasters/hurricane/create"},"hoverEvent":{"action":"show_text","value":"*click*"}}
tellraw @s {"text":"Meteoroid \u25b6","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/natural_disasters/meteoroid/create.1"},"hoverEvent":{"action":"show_text","value":"*click*"}}
tellraw @s {"text":"Sandstorm \u25b6","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/natural_disasters/sandstorm/create"},"hoverEvent":{"action":"show_text","value":"*click*"}}
tellraw @s {"text":"Thunderstorm \u25b6","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/natural_disasters/thunderstorm/create"},"hoverEvent":{"action":"show_text","value":"*click*"}}
tellraw @s {"text":"Volcano \u25b6","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/natural_disasters/volcano/eruption/1"},"hoverEvent":{"action":"show_text","value":"*click*"}}

tellraw @s {"text":""}

tellraw @s {"text":"\u25c0 Go back","color":"red","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/menu/display_menu"},"hoverEvent":{"action":"show_text","contents":"*click*"}}