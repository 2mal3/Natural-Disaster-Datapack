# Description: A 21 second loop for natural disaster sounds
# Called from function: 2mal3:nadi/natural_disasters/...
# Datapack by 2mal3

# Plays the sound to all players with the sound tag
execute as @a[tag=nadi.sound] at @s run function 2mal3:nadi/libraries/sound/sound

# Calls the function again in 21 seconds
schedule function 2mal3:nadi/libraries/sound/loop 21s