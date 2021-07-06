# Description: The effects of the volcanic eruption on entitys
# AS: every entity in the near of the volcano, AT: @s
# Called from function: 2mal3:nadi/natural_disasters/volcano/eruption/eruption
# Datapack by 2mal3

effect give @s minecraft:blindness 60 0 true
data merge entity @s[type=!minecraft:player] {Fire: 1200}
