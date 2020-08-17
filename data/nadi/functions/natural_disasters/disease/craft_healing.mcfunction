# Description: if a player crafts a healing
# Called from: advancement:disease/craft_healing
# Datapck by 2mal3

# give healing
give @s minecraft:firework_star{display:{Name:'{"text":"Remedy","color":"blue"}'}} 1

# reset system stuff
advancement revoke @s only nadi:disease/craft_healing
recipe take @s nadi:disease/healing
clear @s minecraft:knowledge_book 1
