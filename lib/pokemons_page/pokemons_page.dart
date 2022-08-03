import 'package:flutter/material.dart';
import 'package:formation_flutter/model/pokemon.dart';
import 'package:formation_flutter/model/pokemon_stats.dart';
import 'package:formation_flutter/pokemon_page/pokemon_page.dart';

/// Liste de tous les [Pokemon] à afficher
const List<Pokemon> pokemons = [
  Pokemon(
    id: 1,
    name: "Bulbizarre",
    sprite: "https://img.pokemondb.net/sprites/x-y/normal/bulbasaur.png",
    type1: "Plante",
    type2: "Poison",
    weight: 6.9,
    height: 0.7,
    stats: PokemonStats(
      attack: 45,
      attacksp: 49,
      defense: 49,
      defensesp: 65,
      pv: 65,
      speed: 45,
    ),
  ),
  Pokemon(
    id: 2,
    name: "Herbizarre",
    sprite: "https://img.pokemondb.net/sprites/x-y/normal/ivysaur.png",
    type1: "Plante",
    type2: "Poison",
    weight: 13,
    height: 1,
    stats: PokemonStats(
      attack: 60,
      attacksp: 62,
      defense: 63,
      defensesp: 80,
      pv: 80,
      speed: 60,
    ),
  ),
  Pokemon(
    id: 3,
    name: "Florizarre",
    sprite: "https://img.pokemondb.net/sprites/x-y/normal/venusaur-f.png",
    type1: "Plante",
    type2: "Poison",
    weight: 100,
    height: 2,
    stats: PokemonStats(
      attack: 80,
      attacksp: 82,
      defense: 83,
      defensesp: 100,
      pv: 100,
      speed: 80,
    ),
  ),
  Pokemon(
    id: 4,
    name: "Salamèche",
    sprite: "https://img.pokemondb.net/sprites/x-y/normal/charmander.png",
    type1: "Feu",
    type2: null,
    weight: 8.5,
    height: 0.6,
    stats: PokemonStats(
      attack: 39,
      attacksp: 52,
      defense: 43,
      defensesp: 60,
      pv: 50,
      speed: 65,
    ),
  ),
  Pokemon(
    id: 5,
    name: "Reptincel",
    sprite: "https://img.pokemondb.net/sprites/x-y/normal/charmeleon.png",
    type1: "Feu",
    type2: null,
    weight: 19,
    height: 1.1,
    stats: PokemonStats(
      attack: 58,
      attacksp: 64,
      defense: 58,
      defensesp: 80,
      pv: 65,
      speed: 80,
    ),
  ),
  Pokemon(
    id: 6,
    name: "Dracaufeu",
    sprite: "https://img.pokemondb.net/sprites/x-y/normal/charizard.png",
    type1: "Feu",
    type2: "Vol",
    weight: 90.5,
    height: 1.7,
    stats: PokemonStats(
      attack: 78,
      attacksp: 84,
      defense: 78,
      defensesp: 109,
      pv: 85,
      speed: 100,
    ),
  ),
  Pokemon(
    id: 7,
    name: "Carapuce",
    sprite: "https://img.pokemondb.net/sprites/x-y/normal/squirtle.png",
    type1: "Eau",
    type2: null,
    weight: 9,
    height: 0.5,
    stats: PokemonStats(
      attack: 44,
      attacksp: 48,
      defense: 65,
      defensesp: 50,
      pv: 64,
      speed: 43,
    ),
  ),
  Pokemon(
    id: 8,
    name: "Carabaffe",
    sprite: "https://img.pokemondb.net/sprites/x-y/normal/wartortle.png",
    type1: "Eau",
    type2: null,
    weight: 22.5,
    height: 1,
    stats: PokemonStats(
      attack: 59,
      attacksp: 63,
      defense: 80,
      defensesp: 65,
      pv: 80,
      speed: 58,
    ),
  ),
  Pokemon(
    id: 9,
    name: "Tortank",
    sprite: "https://img.pokemondb.net/sprites/x-y/normal/blastoise.png",
    type1: "Eau",
    type2: null,
    weight: 85.5,
    height: 1.6,
    stats: PokemonStats(
      attack: 79,
      attacksp: 83,
      defense: 100,
      defensesp: 85,
      pv: 105,
      speed: 78,
    ),
  ),
];

/// Écran affichant tous les [Pokemon] connus.
///
class PokemonsPage extends StatelessWidget {
  const PokemonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //La classe Scaffold est un widget extensible qui remplit l'espace disponible et fournit les principaux widgets
      appBar: AppBar(
        title: Align(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // On affiche ici l'image disponible dans les assets de l'application
              // [AssetImage] se charge de décoder l'image.
              Image(
                image: AssetImage(
                  'assets/images/pokeball.png',
                ),
                fit: BoxFit.contain,
                height: 32,
              ),
              Text('Pokedex'),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: pokemons.length,
        itemBuilder: (BuildContext context, int index) {
          final pokemon = pokemons[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              // On affiche ici l'image disponible à l'URL [pokemon.sprite]
              // [NetworkImage] se charge de télécharger l'image.
              leading: Image(
                image: NetworkImage(pokemon.sprite),
              ),
              tileColor: Theme.of(context).cardColor,
              title: Text(
                pokemon.name,
              ),
              subtitle: Text(
                "#${pokemon.id}",
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PokemonPage(
                    pokemon: pokemon,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
