
# Function tags to hook in to
functions register {
  nadi:disasters/thunderstorm/api/register
  nadi:disasters/acid_rain/api/register
  nadi:disasters/doline/api/register
  nadi:disasters/blizzard/api/register
  nadi:disasters/meteoroid/api/select
  nadi:disasters/hail/api/select
}

functions select {
  nadi:disasters/thunderstorm/api/select
  nadi:disasters/acid_rain/api/select
  nadi:disasters/doline/api/select
  nadi:disasters/blizzard/api/select
  nadi:disasters/meteoroid/api/select
  nadi:disasters/hail/api/select
}


# Functions needed for the api
function register {
  # Generates a new id for a natural disaster
  scoreboard players add %disasterCount nadi.data 1
  scoreboard players operation .out0 nadi.data = %disasterCount nadi.data
}
