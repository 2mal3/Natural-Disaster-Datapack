# Description: Registers the default natural disasters
# AS: server, AT: server
# Called from function tag: 2mal3:nadi/register/plugins
# Datapack by 2mal3

tellraw @a[scores={nadi.debug_mode=4..}] [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"aqua"},{"text":"/","color":"gray"},{"text":"DEBUG","color":"aqua"},{"text": "/","color": "gray"},{"text":"Server", "color": "aqua"},{"text":"]: ","color":"gray"},{"text":"Registerd default plugin","color":"aqua"}]

data modify storage 2mal3:nadi plugins append value {name: "Default", description: "The default natural disasters", author: "2mal3"}
