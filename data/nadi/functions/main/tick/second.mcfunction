# Description: Tick commands every second
# Called from: main/reload, main/tick_slow
# Datapack by 2mal3

# ingame config
execute as @a[tag=!global.ignore,tag=!global.ignore.gui,tag=nadi.config] run function nadi:config/main

# tick slow
schedule function nadi:main/tick/second 1s
