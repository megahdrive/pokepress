# pokepress
mGBA script to press keys at a certain time. Useful for using pokefinder.

## Usage
1. set your desired frame and offset in the script file (I recommend keeping key release time at the minimum, 1, but if there is issues, you can increase it)
2. Open mgba and load the script BEFORE launching Pokemon (or another game)
3. Once the script prints that it has loaded, launch your pokemon game
4. The countdown will start. Get in game ASAP and ready
5. When the frame minus the offset hits, pokepress will hit A to encounter
6. Voila!

  I recommend using the script [PokemonStatsGen3](https://www.reddit.com/r/pokemonrng/comments/172n3ec/pokemon_gen3_lua_script_for_mgba/) in conjunction with this. It helps you find your offset if needed. I included offset 101 because that worked for me, but it's likely youll have to adjust based on the pokemon you're fighting.
