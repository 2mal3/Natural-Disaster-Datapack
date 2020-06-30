# Description: Open ingame config menu
# Called from: #ndd:config
# Datapack by 2mal3

tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n"}
tellraw @s ["",{"text":"\n"},{"text":" \u0020 \u0020Natural Disaster Datapack Config","bold":true,"color":"red"},{"text":"\n----------------","color":"red"},{"text":"[Refresh]","color":"gold","clickEvent":{"action":"run_command","value":"/function ndd:config"}},{"text":"---------------","color":"red"}]
tellraw @s ["",{"text":"Off is: ","color":"aqua"},{"text":"0","color":"gold"},{"text":"\n"},{"text":"On is: ","color":"aqua"},{"text":"1","color":"gold"}]
tellraw @s {"text":"---------------------------------------","color":"red"}

tellraw @s ["",{"text":"Notifications when a natural disaster start and end:","color":"aqua","clickEvent":{"action":"suggest_command","value":"/scoreboard players set ndd.notifications_on ndd.config <0-1>"}},{"text":" ","color":"aqua"},{"score":{"name":"ndd.notifications_on","objective":"ndd.config"},"color":"gold"}]
