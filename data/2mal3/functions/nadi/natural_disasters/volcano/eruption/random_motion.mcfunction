# Description: Gives random direction to the falling block
# AS: falling blocks from the volcano, AT: @s
# Called from function: 2mal3:nadi/natural_disasters/volcano/eruption/eruption
# Datapack by 2mal3

# Generates a random motion number
scoreboard players set .in_0 2mal3.random 0
scoreboard players set .in_1 2mal3.random 99
function 2mal3:random/random

# Sets a random direction according to the random number
execute if score .out_0 2mal3.random matches 0 run data merge entity @s {Motion: [-1.32d, 0.43d, -0.73d]}
execute if score .out_0 2mal3.random matches 1 run data merge entity @s {Motion: [1.12d, -1.45d, -1.36d]}
execute if score .out_0 2mal3.random matches 2 run data merge entity @s {Motion: [1.32d, -0.12d, -0.92d]}
execute if score .out_0 2mal3.random matches 3 run data merge entity @s {Motion: [-0.23d, 1.34d, 1.20d]}
execute if score .out_0 2mal3.random matches 4 run data merge entity @s {Motion: [0.64d, -1.41d, 0.58d]}
execute if score .out_0 2mal3.random matches 5 run data merge entity @s {Motion: [-0.27d, 0.32d, -0.68d]}
execute if score .out_0 2mal3.random matches 6 run data merge entity @s {Motion: [1.38d, -0.53d, 1.33d]}
execute if score .out_0 2mal3.random matches 7 run data merge entity @s {Motion: [-0.62d, -1.23d, 0.44d]}
execute if score .out_0 2mal3.random matches 8 run data merge entity @s {Motion: [-0.26d, -0.81d, 0.20d]}
execute if score .out_0 2mal3.random matches 9 run data merge entity @s {Motion: [0.70d, -1.28d, 1.27d]}
execute if score .out_0 2mal3.random matches 10 run data merge entity @s {Motion: [-0.77d, 1.17d, -0.37d]}
execute if score .out_0 2mal3.random matches 11 run data merge entity @s {Motion: [0.11d, 0.17d, -1.24d]}
execute if score .out_0 2mal3.random matches 12 run data merge entity @s {Motion: [0.53d, 1.25d, 1.33d]}
execute if score .out_0 2mal3.random matches 13 run data merge entity @s {Motion: [1.25d, -1.22d, -0.50d]}
execute if score .out_0 2mal3.random matches 14 run data merge entity @s {Motion: [-1.30d, 1.12d, -0.60d]}
execute if score .out_0 2mal3.random matches 15 run data merge entity @s {Motion: [-0.82d, -0.29d, -0.95d]}
execute if score .out_0 2mal3.random matches 16 run data merge entity @s {Motion: [-0.93d, 0.89d, 0.48d]}
execute if score .out_0 2mal3.random matches 17 run data merge entity @s {Motion: [-1.30d, 0.05d, 0.03d]}
execute if score .out_0 2mal3.random matches 18 run data merge entity @s {Motion: [-0.73d, -0.67d, -1.46d]}
execute if score .out_0 2mal3.random matches 19 run data merge entity @s {Motion: [-1.50d, 0.27d, -1.04d]}
execute if score .out_0 2mal3.random matches 20 run data merge entity @s {Motion: [-0.80d, 0.15d, 1.45d]}
execute if score .out_0 2mal3.random matches 21 run data merge entity @s {Motion: [-1.31d, 0.57d, -0.78d]}
execute if score .out_0 2mal3.random matches 22 run data merge entity @s {Motion: [-0.52d, 1.39d, -1.05d]}
execute if score .out_0 2mal3.random matches 23 run data merge entity @s {Motion: [-0.74d, 0.12d, 1.02d]}
execute if score .out_0 2mal3.random matches 24 run data merge entity @s {Motion: [-1.33d, -0.50d, 1.41d]}
execute if score .out_0 2mal3.random matches 25 run data merge entity @s {Motion: [-0.58d, 1.06d, 1.35d]}
execute if score .out_0 2mal3.random matches 26 run data merge entity @s {Motion: [1.28d, 1.48d, 1.07d]}
execute if score .out_0 2mal3.random matches 27 run data merge entity @s {Motion: [-0.36d, 0.53d, 0.77d]}
execute if score .out_0 2mal3.random matches 28 run data merge entity @s {Motion: [-0.31d, -0.39d, 0.43d]}
execute if score .out_0 2mal3.random matches 29 run data merge entity @s {Motion: [0.52d, 0.34d, 0.46d]}
execute if score .out_0 2mal3.random matches 30 run data merge entity @s {Motion: [-0.51d, 0.61d, 0.94d]}
execute if score .out_0 2mal3.random matches 31 run data merge entity @s {Motion: [-0.16d, -1.38d, 0.24d]}
execute if score .out_0 2mal3.random matches 32 run data merge entity @s {Motion: [-0.45d, 0.65d, 0.13d]}
execute if score .out_0 2mal3.random matches 33 run data merge entity @s {Motion: [0.93d, 1.07d, -1.06d]}
execute if score .out_0 2mal3.random matches 34 run data merge entity @s {Motion: [-0.76d, -1.08d, -0.22d]}
execute if score .out_0 2mal3.random matches 35 run data merge entity @s {Motion: [-0.78d, -1.34d, 0.41d]}
execute if score .out_0 2mal3.random matches 36 run data merge entity @s {Motion: [-0.47d, 0.14d, -0.27d]}
execute if score .out_0 2mal3.random matches 37 run data merge entity @s {Motion: [1.19d, -0.91d, 1.20d]}
execute if score .out_0 2mal3.random matches 38 run data merge entity @s {Motion: [0.02d, -0.00d, 0.58d]}
execute if score .out_0 2mal3.random matches 39 run data merge entity @s {Motion: [0.03d, 0.74d, -1.03d]}
execute if score .out_0 2mal3.random matches 40 run data merge entity @s {Motion: [0.35d, -0.90d, -1.04d]}
execute if score .out_0 2mal3.random matches 41 run data merge entity @s {Motion: [0.10d, 1.16d, 0.34d]}
execute if score .out_0 2mal3.random matches 42 run data merge entity @s {Motion: [-0.05d, -0.35d, 0.20d]}
execute if score .out_0 2mal3.random matches 43 run data merge entity @s {Motion: [-0.57d, -0.68d, -0.34d]}
execute if score .out_0 2mal3.random matches 44 run data merge entity @s {Motion: [-1.50d, -0.84d, 0.35d]}
execute if score .out_0 2mal3.random matches 45 run data merge entity @s {Motion: [-0.84d, 1.17d, 0.78d]}
execute if score .out_0 2mal3.random matches 46 run data merge entity @s {Motion: [-1.20d, 1.37d, -0.09d]}
execute if score .out_0 2mal3.random matches 47 run data merge entity @s {Motion: [-0.28d, 0.52d, -0.61d]}
execute if score .out_0 2mal3.random matches 48 run data merge entity @s {Motion: [1.05d, 1.14d, 1.06d]}
execute if score .out_0 2mal3.random matches 49 run data merge entity @s {Motion: [-0.96d, 0.43d, 0.10d]}
execute if score .out_0 2mal3.random matches 50 run data merge entity @s {Motion: [-1.34d, -0.26d, 1.11d]}
execute if score .out_0 2mal3.random matches 51 run data merge entity @s {Motion: [-1.34d, 0.08d, -1.26d]}
execute if score .out_0 2mal3.random matches 52 run data merge entity @s {Motion: [-0.19d, 1.30d, 0.16d]}
execute if score .out_0 2mal3.random matches 53 run data merge entity @s {Motion: [-0.76d, -1.36d, -1.08d]}
execute if score .out_0 2mal3.random matches 54 run data merge entity @s {Motion: [1.13d, 1.02d, 1.41d]}
execute if score .out_0 2mal3.random matches 55 run data merge entity @s {Motion: [-0.36d, -0.89d, -0.89d]}
execute if score .out_0 2mal3.random matches 56 run data merge entity @s {Motion: [-1.43d, 0.04d, -0.82d]}
execute if score .out_0 2mal3.random matches 57 run data merge entity @s {Motion: [0.90d, -0.54d, 1.19d]}
execute if score .out_0 2mal3.random matches 58 run data merge entity @s {Motion: [0.47d, -0.12d, -1.36d]}
execute if score .out_0 2mal3.random matches 59 run data merge entity @s {Motion: [0.74d, -0.74d, -0.54d]}
execute if score .out_0 2mal3.random matches 60 run data merge entity @s {Motion: [-1.30d, 0.75d, -0.51d]}
execute if score .out_0 2mal3.random matches 61 run data merge entity @s {Motion: [0.43d, 0.84d, -0.38d]}
execute if score .out_0 2mal3.random matches 62 run data merge entity @s {Motion: [-1.16d, 0.68d, -0.34d]}
execute if score .out_0 2mal3.random matches 63 run data merge entity @s {Motion: [-0.12d, 0.91d, -1.08d]}
execute if score .out_0 2mal3.random matches 64 run data merge entity @s {Motion: [-1.46d, -0.59d, 0.40d]}
execute if score .out_0 2mal3.random matches 65 run data merge entity @s {Motion: [0.04d, 0.91d, -0.71d]}
execute if score .out_0 2mal3.random matches 66 run data merge entity @s {Motion: [-0.26d, -1.37d, -0.59d]}
execute if score .out_0 2mal3.random matches 67 run data merge entity @s {Motion: [-1.26d, -0.61d, -1.22d]}
execute if score .out_0 2mal3.random matches 68 run data merge entity @s {Motion: [-0.04d, 0.42d, 1.46d]}
execute if score .out_0 2mal3.random matches 69 run data merge entity @s {Motion: [-0.44d, 0.90d, -0.36d]}
execute if score .out_0 2mal3.random matches 70 run data merge entity @s {Motion: [-1.13d, -0.91d, -1.14d]}
execute if score .out_0 2mal3.random matches 71 run data merge entity @s {Motion: [0.31d, 0.46d, 0.37d]}
execute if score .out_0 2mal3.random matches 72 run data merge entity @s {Motion: [-0.93d, 0.13d, -0.49d]}
execute if score .out_0 2mal3.random matches 73 run data merge entity @s {Motion: [-0.09d, -0.71d, 1.13d]}
execute if score .out_0 2mal3.random matches 74 run data merge entity @s {Motion: [1.40d, -0.69d, 0.88d]}
execute if score .out_0 2mal3.random matches 75 run data merge entity @s {Motion: [-1.12d, -0.70d, -1.00d]}
execute if score .out_0 2mal3.random matches 76 run data merge entity @s {Motion: [-0.54d, -1.38d, 0.73d]}
execute if score .out_0 2mal3.random matches 77 run data merge entity @s {Motion: [-1.24d, -0.89d, 0.56d]}
execute if score .out_0 2mal3.random matches 78 run data merge entity @s {Motion: [-1.16d, -0.26d, -0.47d]}
execute if score .out_0 2mal3.random matches 79 run data merge entity @s {Motion: [0.80d, -0.29d, -1.26d]}
execute if score .out_0 2mal3.random matches 80 run data merge entity @s {Motion: [0.45d, 1.48d, -1.29d]}
execute if score .out_0 2mal3.random matches 81 run data merge entity @s {Motion: [0.87d, 0.74d, 0.65d]}
execute if score .out_0 2mal3.random matches 82 run data merge entity @s {Motion: [-0.68d, -1.28d, -0.62d]}
execute if score .out_0 2mal3.random matches 83 run data merge entity @s {Motion: [-0.93d, -0.84d, 1.39d]}
execute if score .out_0 2mal3.random matches 84 run data merge entity @s {Motion: [0.42d, -0.36d, -1.26d]}
execute if score .out_0 2mal3.random matches 85 run data merge entity @s {Motion: [-0.51d, -1.35d, -1.00d]}
execute if score .out_0 2mal3.random matches 86 run data merge entity @s {Motion: [0.24d, -1.07d, -1.31d]}
execute if score .out_0 2mal3.random matches 87 run data merge entity @s {Motion: [-0.15d, -0.55d, -0.51d]}
execute if score .out_0 2mal3.random matches 88 run data merge entity @s {Motion: [0.18d, -0.06d, 0.15d]}
execute if score .out_0 2mal3.random matches 89 run data merge entity @s {Motion: [0.70d, -0.45d, -0.75d]}
execute if score .out_0 2mal3.random matches 90 run data merge entity @s {Motion: [0.87d, 0.43d, -1.21d]}
execute if score .out_0 2mal3.random matches 91 run data merge entity @s {Motion: [-0.28d, -0.70d, 0.48d]}
execute if score .out_0 2mal3.random matches 92 run data merge entity @s {Motion: [1.44d, -0.76d, -0.43d]}
execute if score .out_0 2mal3.random matches 93 run data merge entity @s {Motion: [-0.27d, 0.41d, -0.95d]}
execute if score .out_0 2mal3.random matches 94 run data merge entity @s {Motion: [0.13d, 0.26d, 1.49d]}
execute if score .out_0 2mal3.random matches 95 run data merge entity @s {Motion: [0.75d, 0.08d, -0.55d]}
execute if score .out_0 2mal3.random matches 96 run data merge entity @s {Motion: [-0.59d, -0.05d, -0.97d]}
execute if score .out_0 2mal3.random matches 97 run data merge entity @s {Motion: [-0.97d, 0.34d, 0.10d]}
execute if score .out_0 2mal3.random matches 98 run data merge entity @s {Motion: [0.90d, -0.45d, 0.97d]}
execute if score .out_0 2mal3.random matches 99 run data merge entity @s {Motion: [-1.41d, -0.81d, 0.82d]}
