# Description: Creates anchors in the surrounding chunks
# AS: start anchor, AT: @s
# Called from: 2mal3:nadi/natural_disasters/drought/convert_blocks/summon/player
# Datapack by 2mal3

summon minecraft:area_effect_cloud ~ ~ ~ {Tags: ["nadi.anchor"]}
summon minecraft:area_effect_cloud ~16 ~ ~16 {Tags: ["nadi.anchor"]}
summon minecraft:area_effect_cloud ~16 ~ ~ {Tags: ["nadi.anchor"]}
summon minecraft:area_effect_cloud ~16 ~ ~-16 {Tags: ["nadi.anchor"]}
summon minecraft:area_effect_cloud ~ ~ ~-16 {Tags: ["nadi.anchor"]}
summon minecraft:area_effect_cloud ~-16 ~ ~-16 {Tags: ["nadi.anchor"]}
summon minecraft:area_effect_cloud ~-16 ~ ~ {Tags: ["nadi.anchor"]}
summon minecraft:area_effect_cloud ~-16 ~ ~16 {Tags: ["nadi.anchor"]}
summon minecraft:area_effect_cloud ~ ~ ~16 {Tags: ["nadi.anchor"]}
