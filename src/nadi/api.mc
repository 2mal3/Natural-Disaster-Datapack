
dir v1 {
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

  functions stop {
    nadi:disasters/thunderstorm/stop
    nadi:disasters/acid_rain/stop
    nadi:disasters/doline/stop
    nadi:disasters/blizzard/stop
    nadi:disasters/meteoroid/stop
    nadi:disasters/hail/stop
  }

  functions install {
    nadi:disasters/thunderstorm/api/install
    nadi:disasters/acid_rain/api/install
    nadi:disasters/doline/api/install
    nadi:disasters/blizzard/api/install
    nadi:disasters/meteoroid/api/install
    nadi:disasters/hail/api/install
  }

  functions uninstall {
    nadi:disasters/thunderstorm/api/uninstall
    nadi:disasters/acid_rain/api/uninstall
    nadi:disasters/doline/api/uninstall
    nadi:disasters/blizzard/api/uninstall
    nadi:disasters/meteoroid/api/uninstall
    nadi:disasters/hail/api/uninstall
  }

  function challenge_mode {
    nadi:disasters/thunderstorm/api/challenge_mode
    nadi:disasters/acid_rain/api/challenge_mode
    nadi:disasters/doline/api/challenge_mode
    nadi:disasters/blizzard/api/challenge_mode
    nadi:disasters/meteoroid/api/challenge_mode
    nadi:disasters/hail/api/challenge_mode
  }

  # Functions needed for the api
  function register {
    # Generates a new id for a natural disaster
    scoreboard players add %disasterCount nadi.data 1
    scoreboard players operation .out0 nadi.data = %disasterCount nadi.data
  }
}
