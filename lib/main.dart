import 'package:flutter/material.dart';
import 'pokemon_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  List<PokemonInfos> pokemons = [
    PokemonInfos(1, "Bulbizarre", "sprite", "Plante", "Poison", "6,9KG", "0,7m"),
    PokemonInfos(2, "Herbizarre", "sprite", "Plante", "Poison", "13KG", "1m"),
    PokemonInfos(3, "Florizarre", "sprite", "Plante", "Poison", "100KG", "2m"),
    PokemonInfos(4, "Salamèche", "sprite", "Feu", null, "8,5KG", "0,6m"),
    PokemonInfos(5, "Reptincel", "sprite", "Feu", null, "19KG", "1,1m"),
    PokemonInfos(6, "Dracaufeu", "sprite", "Feu", "Vol", "90,5KG", "1,7m"),
    PokemonInfos(7, "Carapuce", "sprite", "Eau", null, "9KG", "0,5m"),
    PokemonInfos(8, "Carabaffe", "sprite", "Eau", null, "22,5 ", "1m"),
    PokemonInfos(9, "Tortank", "sprite", "Eau", null, "85,5KG", "1,6m"),
  ];
  //Ce widget est la racine de votre application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Composant principal de flutter, permet d'accéder à tous les autres composants du SDK Flutter
      home: Scaffold(
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
                title: Text(pokemon.pokemonName),
                subtitle: Text("#${pokemon.id}"),
              ),
            );
          },
        ),
      ),
    );
  }
}
