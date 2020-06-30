# Description: Summon the requert entitys for the hurricane
# Called from: ndd.hurricane:create
# Datapack by 2mal3

summon minecraft:armor_stand ~ 300 ~ {Invulnerable:1b,Invisible:1b,NoBasePlate:1b,PersistenceRequired:1b,Tags:["ndd.hurricane.1"],Motion:[0.0,-5.0,0.0]}

summon minecraft:pig ~ 300 ~ {Silent:1b,Invulnerable:1b,Motion:[0.0,-5.0,0.0],PersistenceRequired:1b,Tags:["ndd.hurricane.2"],ActiveEffects:[{Id:14b,Amplifier:1b,Duration:99999,ShowParticles:0b}],Attributes:[{Name:generic.movementSpeed,Base:0.1}]}
