# Description: if a player crafts a healing
# Called from: advancement
# Datapck by 2mal3

clear @s minecraft:knowledge_book 1
give @s minecraft:firework_star{display:{Name:'{"text":"Remedy","color":"blue"}'}} 1
advancement revoke @s only ndd.disease:craft_healing
recipe take @s ndd.disease:healing
