import 'package:flutter/material.dart';
import 'package:formation_flutter/model/pokemon.dart';
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
  ),
  Pokemon(
    id: 2,
    name: "Herbizarre",
    sprite: "https://img.pokemondb.net/sprites/x-y/normal/ivysaur.png",
    type1: "Plante",
    type2: "Poison",
    weight: 13,
    height: 1,
  ),
  Pokemon(
    id: 3,
    name: "Florizarre",
    sprite: "https://img.pokemondb.net/sprites/x-y/normal/venusaur-f.png",
    type1: "Plante",
    type2: "Poison",
    weight: 100,
    height: 2,
  ),
  Pokemon(
    id: 4,
    name: "Salamèche",
    sprite: "https://img.pokemondb.net/sprites/x-y/normal/charmander.png",
    type1: "Feu",
    type2: null,
    weight: 8.5,
    height: 0.6,
  ),
  Pokemon(
    id: 5,
    name: "Reptincel",
    sprite: "https://img.pokemondb.net/sprites/x-y/normal/charmeleon.png",
    type1: "Feu",
    type2: null,
    weight: 19,
    height: 1.1,
  ),
  Pokemon(
    id: 6,
    name: "Dracaufeu",
    sprite: "https://img.pokemondb.net/sprites/x-y/normal/charizard.png",
    type1: "Feu",
    type2: "Vol",
    weight: 90.5,
    height: 1.7,
  ),
  Pokemon(
    id: 7,
    name: "Carapuce",
    sprite: "https://img.pokemondb.net/sprites/x-y/normal/squirtle.png",
    type1: "Eau",
    type2: null,
    weight: 9,
    height: 0.5,
  ),
  Pokemon(
    id: 8,
    name: "Carabaffe",
    sprite: "https://img.pokemondb.net/sprites/x-y/normal/wartortle.png",
    type1: "Eau",
    type2: null,
    weight: 22.5,
    height: 1,
  ),
  Pokemon(
    id: 9,
    name: "Tortank",
    sprite: "https://img.pokemondb.net/sprites/x-y/normal/blastoise.png",
    type1: "Eau",
    type2: null,
    weight: 85.5,
    height: 1.6,
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
              // TODO : remplacer le [Placeholder] par l'affichage de l'image
              // présente dans les assets au chemin 'assets/images/pokeball.png'
              SizedBox(
                width: 32,
                height: 32,
                child: Placeholder(),
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
              // TODO : remplacer le [Placeholder] par l'affichage de l'image
              // présente sur internet à l'URL [pokemon.sprite]
              leading: const SizedBox(
                height: 32,
                width: 32,
                child: Placeholder(),
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
