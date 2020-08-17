# Description: Shows the player the config menu
# Called from: nadi:config/main
# Datapack by 2mal3

# hurricane
tellraw @s {"text":"---------------Hurricane--------------","color":"gold"}
execute if score $nadi.hurricane nadi.config matches 0 run tellraw @s ["",{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/scoreboard players set $nadi.hurricane nadi.config 1"}},{"text":" Should a hurricane happen?","color":"yellow"}]
execute if score $nadi.hurricane nadi.config matches 1 run tellraw @s ["",{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/scoreboard players set $nadi.hurricane nadi.config 0"}},{"text":" Should a hurricane happen?","color":"yellow"}]

tellraw @s ["",{"text":"How long is this hurricane going to last? (in double ticks, normally 3000) >","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.hurricane_time nadi.config <number>"},"hoverEvent":{"action":"show_text","value":"*click*"}},{"text":" ","color":"yellow"},{"score":{"name":"$nadi.hurricane_time","objective":"nadi.config"},"color":"gold"}]


# blizzard
tellraw @s {"text":"----------------Blizzard--------------","color":"gold"}
execute if score $nadi.blizzard nadi.config matches 0 run tellraw @s ["",{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/scoreboard players set $nadi.blizzard nadi.config 1"}},{"text":" Should a blizzard happen?","color":"yellow"}]
execute if score $nadi.blizzard nadi.config matches 1 run tellraw @s ["",{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/scoreboard players set $nadi.blizzard nadi.config 0"}},{"text":" Should a blizzard happen?","color":"yellow"}]

tellraw @s ["",{"text":"How long is this blizzard going to last? (in seconds, normally 300) >","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.blizzard_time nadi.config <number>"},"hoverEvent":{"action":"show_text","value":"*click*"}},{"text":" ","color":"yellow"},{"score":{"name":"$nadi.blizzard_time","objective":"nadi.config"},"color":"gold"}]


# sandstorm
tellraw @s {"text":"---------------Sandstorm--------------","color":"gold"}
execute if score $nadi.sandstorm nadi.config matches 0 run tellraw @s ["",{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/scoreboard players set $nadi.sandstorm nadi.config 1"}},{"text":" Should a sandstorm happen?","color":"yellow"}]
execute if score $nadi.sandstorm nadi.config matches 1 run tellraw @s ["",{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/scoreboard players set $nadi.sandstorm nadi.config 0"}},{"text":" Should a sandstorm happen?","color":"yellow"}]

tellraw @s ["",{"text":"How long is this sandstorm going to last? (in seconds, normally 300) >","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.sandstorm_time nadi.config <number>"},"hoverEvent":{"action":"show_text","value":"*click*"}},{"text":" ","color":"yellow"},{"score":{"name":"$nadi.sandstorm_time","objective":"nadi.config"},"color":"gold"}]


# volcano
tellraw @s {"text":"----------------Volcano---------------","color":"gold"}
execute if score $nadi.volcano_generate nadi.config matches 0 run tellraw @s ["",{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/scoreboard players set $nadi.volcano_generate nadi.config 1"}},{"text":" Should a Volcano be generated?","color":"yellow"}]
execute if score $nadi.volcano_generate nadi.config matches 1 run tellraw @s ["",{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/scoreboard players set $nadi.volcano_generate nadi.config 0"}},{"text":" Should a Volcano be generated?","color":"yellow"}]

execute if score $nadi.volcano_eruptions nadi.config matches 0 run tellraw @s ["",{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/scoreboard players set $nadi.volcano_eruptions nadi.config 1"}},{"text":" Should it be volcanic eruptions?","color":"yellow"}]
execute if score $nadi.volcano_eruptions nadi.config matches 1 run tellraw @s ["",{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/scoreboard players set $nadi.volcano_eruptions nadi.config 0"}},{"text":" Should it be volcanic eruptions?","color":"yellow"}]



