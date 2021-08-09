
## Update v2.1.0 (9.8.2021)

Sorry for the delay, but here is the new version for 1.17. I decided in this update to add only a new natural disaster (the Zombie Apocalypse), but to improve and balance the existing ones.
I have also completely reworked the API so that others (or otherwise only I) can more easily add new natural disasters and modify existing ones.
I will update the wiki in the next days.

### Added:
- Error message if command blocks are not enabled on a server
- Zombie apocalypse (more infos in the wiki)

### Changed:
- Updated the datapack to 1.17
- The hurricane does more damage
- Acid rain:
  - Damage has been changed to wither damage, so that you can now also die from the rain
  - The rain now gives damage to all entities
  - Etching effect slightly increased
- Explosion radius from meteorites reduced
- Radius from sandstorms increased
- Lightning strikes from thunderstorm made more random
- Better pack description
- Improved natural Disasters start menu
- Better performance
- Improved compatibility with other datapacks
- Completely new API (more infos in the wiki)
- [Internal] Datapack libraries updated
- [Internal] Improved debug messages
- [Internal] Better variable names
- [Internal] Code cleanup

### Bug fixes:
- [Internal] For some natural disasters the sky detection was not yet updated

----------------------------------------------------------------

## Update v2.0.0 (15.3.2021)

After a very long time finally an update.                                                                           
This one is mainly about improvements, adjustments and bug fixes, for which almost the entire datapack was reworked. More detailed information can be found below.                                                                
In addition, the datapack menu has been greatly simplified and improved, so that the datapack is much easier to control and customize.

### Added:
- Completely new in game menu:
  - Simple option to stop natural disasters
  - Many more configuration options
  - Links to the website and wiki
  - Nicer
  - Faster 
- Datapack icon
- Debug system
- Drought:
  - A few smoke particles for a better ambience
  - During drought plants grow 3 times slower
- Sandstorm: Pushes all players who are not protected aside
- Hurricane:
  - Certain probability that there is an explosion nearby
  - Blocks thrown by the hurricane cause damage

### Changed:
- Default duration of natural disasters extended from 5 to 10 minutes
- Time unit for the length of natural disasters changed to minutes
- Improved detection in natural disasters whether a player is under the sky
- Better compatibility with other datapacks
- Better performance
- Better detection of unsupported versions
- Most natural disasters start only 1 minute after selection
- Better code
- Acid rain:
  - More blocks will be removed
  - Better particles
- Blizzard: Better particles
- Doline: Minimal less destroyed hole
- Volcano: Is now generated less frequently
- Drought: The drought now affects a much larger area around the player
- Firestorm:
  - 4 times more fire
  - Better fire simulation method
- Hail:
  - Hailstones do more damage
  - Hail now has a higher probability to hit you
- Sandstorm: Better particles
- Hurricane:
  - Probability and radius of falling blocks increased
  - The hurricane moves 3x faster
  - More random directions for thrown away blocks
  - Block converter updated

### Bug fixes:
- Many natural disasters affected players who were not in the overworld
- Natural disasters could be triggered even if no one was in the world
- Some natural disasters had an effect on spectators
- The wind sounds during natural disasters sometimes behaved strangely
- Generating high random numbers has led to lags
- Hail: Hailstones have not done any damage
- More, but I do not remember

### Removed:
- Disease
- Old in game menu
- Old and unnecessary code that was no longer used

----------------------------------------------------------------
