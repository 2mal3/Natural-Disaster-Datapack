# Description: A 21 second loop for wind sounds
# Datapack by 2mal3

# Plays the sound to all players with the sound tag
execute as @a[tag=nadi.sound] at @s run function 2mal3:nadi/utilities/sound/sound

# Calls the function again in 21 seconds
schedule function 2mal3:nadi/utilities/sound/loop 21s
