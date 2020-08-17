# Description: send messages if the du version is wrong
# Called from: nadi:main/reload/1
# Datapack by 2mal3

tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] [{"text":"Datapack Utilities or a newer version of it is needed for the Natural Diaster Datapack to work. Datapack Utilities can be downloaded ","color":"red"},{"text":"here","color":"blue","clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/data-pack/datapack-utils/"}},{"text":".","color":"red"}]
