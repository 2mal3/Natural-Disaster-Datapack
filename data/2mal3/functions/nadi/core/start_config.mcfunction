###########################################
##### Natural Disaser Datapack Config #####
###########################################

##### Info #####
# To change the settings you only have to change the numbers at the end of the line.
# 1 = true
# 0 = false
################


##### General #####
# Should natural disasters be sent notifications when start and end?
scoreboard players set $nadi.notifications_on nadi.config 1

# To indicate the time between natural disasters, go to: data > nadi.config > loot_tables > random_time.json


##### meteoroid #####
# Should a meteoroid happen?
scoreboard players set $nadi.meteoroid nadi.config 1

###### thunderstorm #####
# Should a thunderstorm happen?
scoreboard players set $nadi.thunderstorm nadi.config 1
# How long will the thunderstorm rain (in seconds * 5, normally 150)
scoreboard players set $nadi.thunderstorm_time nadi.config 150

##### doline #####
# Should a doline happen?
scoreboard players set $nadi.doline nadi.config 1
# How deep should the doline hole be? (in blocks, normally 30)
scoreboard players set $nadi.doline_time nadi.config 30

##### hail #####
# Should a hail happen?
scoreboard players set $nadi.hail nadi.config 1
# How long will the hail rain (in double seconds, normally 150)
scoreboard players set $nadi.hail_time nadi.config 150

##### drought #####
# Should a drought happen?
scoreboard players set $nadi.drought nadi.config 1
# How long is this drought going to last? (in half seconds, normally 600)
scoreboard players set $nadi.drought_time nadi.config 600

##### firestorm #####
# Should a firestorm happen?
scoreboard players set $nadi.firestorm nadi.config 1
# How long is this firestorm going to last? (in double seconds, normally 150)
scoreboard players set $nadi.firestorm_time nadi.config 150

##### acid rain #####
# Should a acid rain happen?
scoreboard players set $nadi.acid_rain nadi.config 1
# How long will the acid rain? (in double seconds, normally 150)
scoreboard players set $nadi.acid_rain_time nadi.config 150

##### disease #####
# Should a disease happen?
scoreboard players set $nadi.disease nadi.config 1

##### hurricane #####
# Should a hurricane happen?
scoreboard players set $nadi.hurricane nadi.config 1
# How long is this hurricane going to last? (in double ticks, normally 3000)
scoreboard players set $nadi.hurricane_time nadi.config 3000

##### blizzard #####
# Should a blizzard happen?
scoreboard players set $nadi.blizzard nadi.config 1
# How long is this blizzard going to last? (in seconds, normally 300)
scoreboard players set $nadi.blizzard_time nadi.config 300

##### sandstorm #####
# Should a sandstorm happen?
scoreboard players set $nadi.sandstorm nadi.config 1
# How long is this sandstorm going to last? (in seconds, normally 300)
scoreboard players set $nadi.sandstorm_time nadi.config 300

##### volcano #####
# Should a Volcano be generated?
scoreboard players set $nadi.volcano_generate nadi.config 1
# Should it be volcanic eruptions?
scoreboard players set $nadi.volcano_eruptions nadi.config 1