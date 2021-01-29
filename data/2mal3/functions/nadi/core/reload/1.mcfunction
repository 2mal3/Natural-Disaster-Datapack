# Description: tests the right minecraft and du version is selectet
# Called from: #reaload
# Datapack by 2mal3

# test right
execute if score $du.ver load matches 2020002.. run schedule function 2mal3:nadi/core/reload/2 2s

# du version is wrong
execute unless score $du.ver load matches 2020002.. run schedule function 2mal3:nadi/core/reload/false 2s
