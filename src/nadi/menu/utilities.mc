
# Help function to make the UI cleaner
function click {
  playsound minecraft:ui.button.click master @s
  # Disables command feedback for a short time, so that no disturbing message is displayed
  gamerule sendCommandFeedback false
  schedule 1t replace {
    gamerule sendCommandFeedback true
  }
}
