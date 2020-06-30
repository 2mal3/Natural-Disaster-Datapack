# Description: set the volcano blocks a random motion
# Called from: ndd.volcano:eruption/2
# Datapack by 2mal3

# get random number
execute store result score @s ndd.data run loot spawn ~ ~ ~ loot ndd.volcano:random_motion

# set motion from ranom numer
execute if score @s ndd.data matches 0 run data merge entity @s {Motion:[-1.32,0.43,-0.73]}
execute if score @s ndd.data matches 1 run data merge entity @s {Motion:[1.12,-1.45,-1.36]}
execute if score @s ndd.data matches 2 run data merge entity @s {Motion:[1.32,-0.12,-0.92]}
execute if score @s ndd.data matches 3 run data merge entity @s {Motion:[-0.23,1.34,1.20]}
execute if score @s ndd.data matches 4 run data merge entity @s {Motion:[0.64,-1.41,0.58]}
execute if score @s ndd.data matches 5 run data merge entity @s {Motion:[-0.27,0.32,-0.68]}
execute if score @s ndd.data matches 6 run data merge entity @s {Motion:[1.38,-0.53,1.33]}
execute if score @s ndd.data matches 7 run data merge entity @s {Motion:[-0.62,-1.23,0.44]}
execute if score @s ndd.data matches 8 run data merge entity @s {Motion:[-0.26,-0.81,0.20]}
execute if score @s ndd.data matches 9 run data merge entity @s {Motion:[0.70,-1.28,1.27]}
execute if score @s ndd.data matches 10 run data merge entity @s {Motion:[-0.77,1.17,-0.37]}
execute if score @s ndd.data matches 11 run data merge entity @s {Motion:[0.11,0.17,-1.24]}
execute if score @s ndd.data matches 12 run data merge entity @s {Motion:[0.53,1.25,1.33]}
execute if score @s ndd.data matches 13 run data merge entity @s {Motion:[1.25,-1.22,-0.50]}
execute if score @s ndd.data matches 14 run data merge entity @s {Motion:[-1.30,1.12,-0.60]}
execute if score @s ndd.data matches 15 run data merge entity @s {Motion:[-0.82,-0.29,-0.95]}
execute if score @s ndd.data matches 16 run data merge entity @s {Motion:[-0.93,0.89,0.48]}
execute if score @s ndd.data matches 17 run data merge entity @s {Motion:[-1.30,0.05,0.03]}
execute if score @s ndd.data matches 18 run data merge entity @s {Motion:[-0.73,-0.67,-1.46]}
execute if score @s ndd.data matches 19 run data merge entity @s {Motion:[-1.50,0.27,-1.04]}
execute if score @s ndd.data matches 20 run data merge entity @s {Motion:[-0.80,0.15,1.45]}
execute if score @s ndd.data matches 21 run data merge entity @s {Motion:[-1.31,0.57,-0.78]}
execute if score @s ndd.data matches 22 run data merge entity @s {Motion:[-0.52,1.39,-1.05]}
execute if score @s ndd.data matches 23 run data merge entity @s {Motion:[-0.74,0.12,1.02]}
execute if score @s ndd.data matches 24 run data merge entity @s {Motion:[-1.33,-0.50,1.41]}
execute if score @s ndd.data matches 25 run data merge entity @s {Motion:[-0.58,1.06,1.35]}
execute if score @s ndd.data matches 26 run data merge entity @s {Motion:[1.28,1.48,1.07]}
execute if score @s ndd.data matches 27 run data merge entity @s {Motion:[-0.36,0.53,0.77]}
execute if score @s ndd.data matches 28 run data merge entity @s {Motion:[-0.31,-0.39,0.43]}
execute if score @s ndd.data matches 29 run data merge entity @s {Motion:[0.52,0.34,0.46]}
execute if score @s ndd.data matches 30 run data merge entity @s {Motion:[-0.51,0.61,0.94]}
execute if score @s ndd.data matches 31 run data merge entity @s {Motion:[-0.16,-1.38,0.24]}
execute if score @s ndd.data matches 32 run data merge entity @s {Motion:[-0.45,0.65,0.13]}
execute if score @s ndd.data matches 33 run data merge entity @s {Motion:[0.93,1.07,-1.06]}
execute if score @s ndd.data matches 34 run data merge entity @s {Motion:[-0.76,-1.08,-0.22]}
execute if score @s ndd.data matches 35 run data merge entity @s {Motion:[-0.78,-1.34,0.41]}
execute if score @s ndd.data matches 36 run data merge entity @s {Motion:[-0.47,0.14,-0.27]}
execute if score @s ndd.data matches 37 run data merge entity @s {Motion:[1.19,-0.91,1.20]}
execute if score @s ndd.data matches 38 run data merge entity @s {Motion:[0.02,-0.00,0.58]}
execute if score @s ndd.data matches 39 run data merge entity @s {Motion:[0.03,0.74,-1.03]}
execute if score @s ndd.data matches 40 run data merge entity @s {Motion:[0.35,-0.90,-1.04]}
execute if score @s ndd.data matches 41 run data merge entity @s {Motion:[0.10,1.16,0.34]}
execute if score @s ndd.data matches 42 run data merge entity @s {Motion:[-0.05,-0.35,0.20]}
execute if score @s ndd.data matches 43 run data merge entity @s {Motion:[-0.57,-0.68,-0.34]}
execute if score @s ndd.data matches 44 run data merge entity @s {Motion:[-1.50,-0.84,0.35]}
execute if score @s ndd.data matches 45 run data merge entity @s {Motion:[-0.84,1.17,0.78]}
execute if score @s ndd.data matches 46 run data merge entity @s {Motion:[-1.20,1.37,-0.09]}
execute if score @s ndd.data matches 47 run data merge entity @s {Motion:[-0.28,0.52,-0.61]}
execute if score @s ndd.data matches 48 run data merge entity @s {Motion:[1.05,1.14,1.06]}
execute if score @s ndd.data matches 49 run data merge entity @s {Motion:[-0.96,0.43,0.10]}
execute if score @s ndd.data matches 50 run data merge entity @s {Motion:[-1.34,-0.26,1.11]}
execute if score @s ndd.data matches 51 run data merge entity @s {Motion:[-1.34,0.08,-1.26]}
execute if score @s ndd.data matches 52 run data merge entity @s {Motion:[-0.19,1.30,0.16]}
execute if score @s ndd.data matches 53 run data merge entity @s {Motion:[-0.76,-1.36,-1.08]}
execute if score @s ndd.data matches 54 run data merge entity @s {Motion:[1.13,1.02,1.41]}
execute if score @s ndd.data matches 55 run data merge entity @s {Motion:[-0.36,-0.89,-0.89]}
execute if score @s ndd.data matches 56 run data merge entity @s {Motion:[-1.43,0.04,-0.82]}
execute if score @s ndd.data matches 57 run data merge entity @s {Motion:[0.90,-0.54,1.19]}
execute if score @s ndd.data matches 58 run data merge entity @s {Motion:[0.47,-0.12,-1.36]}
execute if score @s ndd.data matches 59 run data merge entity @s {Motion:[0.74,-0.74,-0.54]}
execute if score @s ndd.data matches 60 run data merge entity @s {Motion:[-1.30,0.75,-0.51]}
execute if score @s ndd.data matches 61 run data merge entity @s {Motion:[0.43,0.84,-0.38]}
execute if score @s ndd.data matches 62 run data merge entity @s {Motion:[-1.16,0.68,-0.34]}
execute if score @s ndd.data matches 63 run data merge entity @s {Motion:[-0.12,0.91,-1.08]}
execute if score @s ndd.data matches 64 run data merge entity @s {Motion:[-1.46,-0.59,0.40]}
execute if score @s ndd.data matches 65 run data merge entity @s {Motion:[0.04,0.91,-0.71]}
execute if score @s ndd.data matches 66 run data merge entity @s {Motion:[-0.26,-1.37,-0.59]}
execute if score @s ndd.data matches 67 run data merge entity @s {Motion:[-1.26,-0.61,-1.22]}
execute if score @s ndd.data matches 68 run data merge entity @s {Motion:[-0.04,0.42,1.46]}
execute if score @s ndd.data matches 69 run data merge entity @s {Motion:[-0.44,0.90,-0.36]}
execute if score @s ndd.data matches 70 run data merge entity @s {Motion:[-1.13,-0.91,-1.14]}
execute if score @s ndd.data matches 71 run data merge entity @s {Motion:[0.31,0.46,0.37]}
execute if score @s ndd.data matches 72 run data merge entity @s {Motion:[-0.93,0.13,-0.49]}
execute if score @s ndd.data matches 73 run data merge entity @s {Motion:[-0.09,-0.71,1.13]}
execute if score @s ndd.data matches 74 run data merge entity @s {Motion:[1.40,-0.69,0.88]}
execute if score @s ndd.data matches 75 run data merge entity @s {Motion:[-1.12,-0.70,-1.00]}
execute if score @s ndd.data matches 76 run data merge entity @s {Motion:[-0.54,-1.38,0.73]}
execute if score @s ndd.data matches 77 run data merge entity @s {Motion:[-1.24,-0.89,0.56]}
execute if score @s ndd.data matches 78 run data merge entity @s {Motion:[-1.16,-0.26,-0.47]}
execute if score @s ndd.data matches 79 run data merge entity @s {Motion:[0.80,-0.29,-1.26]}
execute if score @s ndd.data matches 80 run data merge entity @s {Motion:[0.45,1.48,-1.29]}
execute if score @s ndd.data matches 81 run data merge entity @s {Motion:[0.87,0.74,0.65]}
execute if score @s ndd.data matches 82 run data merge entity @s {Motion:[-0.68,-1.28,-0.62]}
execute if score @s ndd.data matches 83 run data merge entity @s {Motion:[-0.93,-0.84,1.39]}
execute if score @s ndd.data matches 84 run data merge entity @s {Motion:[0.42,-0.36,-1.26]}
execute if score @s ndd.data matches 85 run data merge entity @s {Motion:[-0.51,-1.35,-1.00]}
execute if score @s ndd.data matches 86 run data merge entity @s {Motion:[0.24,-1.07,-1.31]}
execute if score @s ndd.data matches 87 run data merge entity @s {Motion:[-0.15,-0.55,-0.51]}
execute if score @s ndd.data matches 88 run data merge entity @s {Motion:[0.18,-0.06,0.15]}
execute if score @s ndd.data matches 89 run data merge entity @s {Motion:[0.70,-0.45,-0.75]}
execute if score @s ndd.data matches 90 run data merge entity @s {Motion:[0.87,0.43,-1.21]}
execute if score @s ndd.data matches 91 run data merge entity @s {Motion:[-0.28,-0.70,0.48]}
execute if score @s ndd.data matches 92 run data merge entity @s {Motion:[1.44,-0.76,-0.43]}
execute if score @s ndd.data matches 93 run data merge entity @s {Motion:[-0.27,0.41,-0.95]}
execute if score @s ndd.data matches 94 run data merge entity @s {Motion:[0.13,0.26,1.49]}
execute if score @s ndd.data matches 95 run data merge entity @s {Motion:[0.75,0.08,-0.55]}
execute if score @s ndd.data matches 96 run data merge entity @s {Motion:[-0.59,-0.05,-0.97]}
execute if score @s ndd.data matches 97 run data merge entity @s {Motion:[-0.97,0.34,0.10]}
execute if score @s ndd.data matches 98 run data merge entity @s {Motion:[0.90,-0.45,0.97]}
execute if score @s ndd.data matches 99 run data merge entity @s {Motion:[-1.41,-0.81,0.82]}


# reset scoreboards
scoreboard players reset @s ndd.data
