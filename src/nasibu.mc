
function load {
  scoreboard objectives add nasibu dummy

  execute unless score $installed nasibu matches 1 run function nasibu:install
}

function install {
  scoreboard players set $installed nasibu 1

  #declare score_holder .in0
  #declare score_holder .in1
  #declare score_holder .out0

  execute store result score .rng nasibu run seed
  scoreboard players set $65536 nasibu 65536
  scoreboard players set $multiplier nasibu 1664525
  scoreboard players set $increment nasibu 1013904223
  scoreboard players set .bitSwap nasibu 0
}

function random {
  # Generate random number separated
  scoreboard players operation .rng nasibu *= $multiplier nasibu
  scoreboard players operation .rng nasibu += $increment nasibu

  # Swap bits
  scoreboard players operation .bitSwap nasibu = .rng nasibu
  scoreboard players operation .bitSwap nasibu /= $65536 nasibu
  scoreboard players operation .rng nasibu *= $65536 nasibu
  scoreboard players operation .rng nasibu += .bitSwap nasibu

  # Return output
  scoreboard players operation .temp0 nasibu = .in1 nasibu
  scoreboard players operation .temp0 nasibu -= .in0 nasibu
  scoreboard players add .temp0 nasibu 1
  scoreboard players operation .out0 nasibu = .rng nasibu
  scoreboard players operation .out0 nasibu %= .temp0 nasibu
  scoreboard players operation .out0 nasibu += .in0 nasibu
}
