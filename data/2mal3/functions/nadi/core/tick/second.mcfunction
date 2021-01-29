# Description: core loop every second
# Called from functions: 2mal3:nadi/core/reload, 2mal3:nadi/core/tick/second
# Datapack by 2mal3

# ingame config
execute as @a[tag=!global.ignore,tag=!global.ignore.gui,tag=nadi.config] run function 2mal3:nadi/config/main

# Calls the function in the next second
schedule function 2mal3:nadi/core/tick/second 1s
