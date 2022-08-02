import 'package:flutter/material.dart';
import 'package:formation_flutter/model/pokemon.dart';
import 'package:formation_flutter/pokemon_page/pokemon_page.dart';

/// Liste de tous les [Pokemon] à afficher
const List<Pokemon> pokemons = [
  Pokemon(
    id: 1,
    name: "Bulbizarre",
    sprite: "sprite",
    type1: "Plante",
    type2: "Poison",
    weight: 6.9,
    height: 0.7,
  ),
  Pokemon(
    id: 2,
    name: "Herbizarre",
    sprite: "sprite",
    type1: "Plante",
    type2: "Poison",
    weight: 13,
    height: 1,
  ),
  Pokemon(
    id: 3,
    name: "Florizarre",
    sprite: "sprite",
    type1: "Plante",
    type2: "Poison",
    weight: 100,
    height: 2,
  ),
  Pokemon(
    id: 4,
    name: "Salamèche",
    sprite: "sprite",
    type1: "Feu",
    type2: null,
    weight: 8.5,
    height: 0.6,
  ),
  Pokemon(
    id: 5,
    name: "Reptincel",
    sprite: "sprite",
    type1: "Feu",
    type2: null,
    weight: 19,
    height: 1.1,
  ),
  Pokemon(
    id: 6,
    name: "Dracaufeu",
    sprite: "sprite",
    type1: "Feu",
    type2: "Vol",
    weight: 90.5,
    height: 1.7,
  ),
  Pokemon(
    id: 7,
    name: "Carapuce",
    sprite: "sprite",
    type1: "Eau",
    type2: null,
    weight: 9,
    height: 0.5,
  ),
  Pokemon(
    id: 8,
    name: "Carabaffe",
    sprite: "sprite",
    type1: "Eau",
    type2: null,
    weight: 22.5,
    height: 1,
  ),
  Pokemon(
    id: 9,
    name: "Tortank",
    sprite: "sprite",
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
        title: const Align(
          child: Text("Pokedex"),
        ),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: pokemons.length,
        itemBuilder: (BuildContext context, int index) {
          final pokemon = pokemons[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.grey,
              title: Text(pokemon.name),
              subtitle: Text("#${pokemon.id}"),
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
