# Description: Shows the player the config menu
# Called from: 2mal3:nadi/config/core
# Datapack by 2mal3

# notifications
execute if score @s nadi.data matches 1 run tellraw @s {"text":"----------------General------------","color":"gold"}
execute if score $nadi.notifications_on nadi.config matches 0 run tellraw @s ["",{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/scoreboard players set $nadi.notifications_on nadi.config 1"}},{"text":" Notifications are sent when a natural disaster starts or ends.","color":"yellow"}]
execute if score $nadi.notifications_on nadi.config matches 1 run tellraw @s ["",{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/scoreboard players set $nadi.notifications_on nadi.config 0"}},{"text":" Notifications are sent when a natural disaster starts or ends.","color":"yellow"}]


# meteoroid
tellraw @s {"text":"---------------Meteoroid--------------","color":"gold"}
execute if score $nadi.meteoroid nadi.config matches 0 run tellraw @s ["",{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/scoreboard players set $nadi.meteoroid nadi.config 1"}},{"text":" Should a meteoroid happen?","color":"yellow"}]
execute if score $nadi.meteoroid nadi.config matches 1 run tellraw @s ["",{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/scoreboard players set $nadi.meteoroid nadi.config 0"}},{"text":" Should a meteoroid happen?","color":"yellow"}]


# thunderstorm
tellraw @s {"text":"-------------Thunderstorm-------------","color":"gold"}
execute if score $nadi.thunderstorm nadi.config matches 0 run tellraw @s ["",{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/scoreboard players set $nadi.thunderstorm nadi.config 1"}},{"text":" Should a thunderstorm happen?","color":"yellow"}]
execute if score $nadi.thunderstorm nadi.config matches 1 run tellraw @s ["",{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/scoreboard players set $nadi.thunderstorm nadi.config 0"}},{"text":" Should a thunderstorm happen?","color":"yellow"}]

tellraw @s ["",{"text":"How long will the thunderstorm rain (in seconds * 5, normally 150) >","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.thunderstorm_time nadi.config <number>"},"hoverEvent":{"action":"show_text","value":"*click*"}},{"text":" ","color":"yellow"},{"score":{"name":"$nadi.thunderstorm_time","objective":"nadi.config"},"color":"gold"}]


# doline
tellraw @s {"text":"----------------Doline----------------","color":"gold"}
execute if score $nadi.doline nadi.config matches 0 run tellraw @s ["",{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/scoreboard players set $nadi.doline nadi.config 1"}},{"text":" Should a doline happen?","color":"yellow"}]
execute if score $nadi.doline nadi.config matches 1 run tellraw @s ["",{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/scoreboard players set $nadi.doline nadi.config 0"}},{"text":" Should a doline happen?","color":"yellow"}]

tellraw @s ["",{"text":"How deep should the doline hole be? (in blocks, normally 30) >","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.doline_time nadi.config <number>"},"hoverEvent":{"action":"show_text","value":"*click*"}},{"text":" ","color":"yellow"},{"score":{"name":"$nadi.doline_time","objective":"nadi.config"},"color":"gold"}]


# hail
tellraw @s {"text":"-----------------Hail-----------------","color":"gold"}
execute if score $nadi.hail nadi.config matches 0 run tellraw @s ["",{"text":"[\u274c]","color":"dark_red","clickEvent":{"action":"run_command","value":"/scoreboard players set $nadi.hail nadi.config 1"}},{"text":" Should a hail happen?","color":"yellow"}]
execute if score $nadi.hail nadi.config matches 1 run tellraw @s ["",{"text":"[\u2714]","color":"dark_green","clickEvent":{"action":"run_command","value":"/scoreboard players set $nadi.hail nadi.config 0"}},{"text":" Should a hail happen?","color":"yellow"}]

tellraw @s ["",{"text":"How long will the hail rain? (in double seconds, normally 150) >","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set $nadi.hail_time nadi.config <number>"},"hoverEvent":{"action":"show_text","value":"*click*"}},{"text":" ","color":"yellow"},{"score":{"name":"$nadi.hail_time","objective":"nadi.config"},"color":"gold"}]
