# Description: Shows the player the config menu
# Called from: 2mal3:nadi/core/tick
# Datapack by 2mal3

# Pull the text up
tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
tellraw @s {"text":" \u0020 \u0020Natural Disaster Datapack Config \u0020 ","bold":true,"color":"gold"}


# Page selector
execute if score @s nadi.data matches 1 run tellraw @s [{"text":"-----------------------------------","color":"gold"},{"text":"[>]","color":"yellow","clickEvent":{"action":"run_command","value":"/scoreboard players set @s nadi.data 2"},"hoverEvent":{"action":"show_text","value":"*click*"}}]
execute if score @s nadi.data matches 2 run tellraw @s [{"text":"[<]","color":"yellow","clickEvent":{"action":"run_command","value":"/scoreboard players set @s nadi.data 1"},"hoverEvent":{"action":"show_text","value":"*click*"}},{"text":"----------------General------------","color":"gold"},{"text":"[>]","color":"yellow","clickEvent":{"action":"run_command","value":"/scoreboard players set @s nadi.data 3"},"hoverEvent":{"action":"show_text","value":"*click*"}}]
execute if score @s nadi.data matches 3 run tellraw @s [{"text":"[<]","color":"yellow","clickEvent":{"action":"run_command","value":"/scoreboard players set @s nadi.data 2"},"hoverEvent":{"action":"show_text","value":"*click*"}},{"text":"-------------General---------------","color":"gold"}]

tellraw @s {"text":"\n"}


# print Page
execute if score @s nadi.data matches 1 run function 2mal3:nadi/config/page_1
execute if score @s nadi.data matches 2 run function 2mal3:nadi/config/page_2
execute if score @s nadi.data matches 3 run function 2mal3:nadi/config/page_3


# tellraw the save Button
tellraw @s [{"text":"\n----------------","color":"gold"},{"text":"[Save]","color":"gold","clickEvent":{"action":"run_command","value":"/function 2mal3:nadi/config/end"}},{"text":"----------------","color":"gold"}]
