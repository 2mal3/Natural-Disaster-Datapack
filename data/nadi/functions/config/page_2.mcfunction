# Description: Shows the player the config menu
# Called from: nadi:config/main
# Datapack by 2mal3

# drought
tellraw @s {"text":"----------------Drought---------------","color":"gold"}
execute if score $nadi.drought nadi.config matches 0 run tellraw @s ["",{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/scoreboard players set $nadi.drought nadi.config 1"}},{"text":" Should a drought happen?","color":"yellow"}]
execute if score $nadi.drought nadi.config matches 1 run tellraw @s ["",{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/scoreboard players set $nadi.drought nadi.config 0"}},{"text":" Should a drought happen?","color":"yellow"}]

tellraw @s ["",{"text":"How long is this drought going to last? (in half seconds, normally 600) >","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.drought_time nadi.config <number>"},"hoverEvent":{"action":"show_text","value":"*click*"}},{"text":" ","color":"yellow"},{"score":{"name":"$nadi.drought_time","objective":"nadi.config"},"color":"gold"}]


# firestorm
tellraw @s {"text":"---------------Firestorm--------------","color":"gold"}
execute if score $nadi.firestorm nadi.config matches 0 run tellraw @s ["",{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/scoreboard players set $nadi.firestorm nadi.config 1"}},{"text":" Should a firestorm happen?","color":"yellow"}]
execute if score $nadi.firestorm nadi.config matches 1 run tellraw @s ["",{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/scoreboard players set $nadi.firestorm nadi.config 0"}},{"text":" Should a firestorm happen?","color":"yellow"}]

tellraw @s ["",{"text":"How long is this firestorm going to last? (in double seconds, normally 150) >","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.firestorm_time nadi.config <number>"},"hoverEvent":{"action":"show_text","value":"*click*"}},{"text":" ","color":"yellow"},{"score":{"name":"$nadi.firestorm_time","objective":"nadi.config"},"color":"gold"}]


# acid_rain
tellraw @s {"text":"---------------Acid rain--------------","color":"gold"}
execute if score $nadi.acid_rain nadi.config matches 0 run tellraw @s ["",{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/scoreboard players set $nadi.acid_rain nadi.config 1"}},{"text":" Should a acid_rain happen?","color":"yellow"}]
execute if score $nadi.acid_rain nadi.config matches 1 run tellraw @s ["",{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/scoreboard players set $nadi.acid_rain nadi.config 0"}},{"text":" Should a acid_rain happen?","color":"yellow"}]

tellraw @s ["",{"text":"How long will the acid rain? (in double seconds, normally 150) >","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.acid_rain_time nadi.config <number>"},"hoverEvent":{"action":"show_text","value":"*click*"}},{"text":" ","color":"yellow"},{"score":{"name":"$nadi.acid_rain_time","objective":"nadi.config"},"color":"gold"}]


# disease
tellraw @s {"text":"----------------Disease---------------","color":"gold"}
execute if score $nadi.disease nadi.config matches 0 run tellraw @s ["",{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/scoreboard players set $nadi.disease nadi.config 1"}},{"text":" Should a disease happen?","color":"yellow"}]
execute if score $nadi.disease nadi.config matches 1 run tellraw @s ["",{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/scoreboard players set $nadi.disease nadi.config 0"}},{"text":" Should a disease happen?","color":"yellow"}]
