# Description: Notify players when Datapack Utilities is not available or too old
# Called from function: 2mal3:nadi/core/reload/test
# Datapack by 2mal3

# Output debug message in chat, if enabled (FATAL)
tellraw @a [{"text":"[","color":"gray"},{"text":"NaturalDisaster","color":"dark_red"},{"text":"/","color":"gray"},{"text":"FATAL","color":"dark_red"},{"text":"]: ","color":"gray"},{"text":"Datapack Utilities not installed or out of date.","color":"dark_red"}]

tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] [{"text":"Datapack Utilities or a newer version of it is needed for the Natural Diaster Datapack to work. Datapack Utilities can be downloaded ","color":"red"},{"text":"here","color":"blue","clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/data-pack/datapack-utils/"}},{"text":".","color":"red"}]
