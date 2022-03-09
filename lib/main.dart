import 'package:flutter/material.dart';
import 'package:formation_flutter/pokemon_page/pokemon_page.dart';
import 'pokemon_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  List<PokemonInfos> pokemons = [
    PokemonInfos(1, "Bulbizarre", "sprite", "Plante", "Poison", "6,9", "0,7"),
    PokemonInfos(2, "Herbizarre", "sprite", "Plante", "Poison", "13", "1"),
    PokemonInfos(3, "Florizarre", "sprite", "Plante", "Poison", "100", "2"),
    PokemonInfos(4, "Salamèche", "sprite", "Feu", null, "8,5", "0,6"),
    PokemonInfos(5, "Reptincel", "sprite", "Feu", null, "19", "1,1"),
    PokemonInfos(6, "Dracaufeu", "sprite", "Feu", "Vol", "90,5", "1,7"),
    PokemonInfos(7, "Carapuce", "sprite", "Eau", null, "9", "0,5"),
    PokemonInfos(8, "Carabaffe", "sprite", "Eau", null, "22,5 ", "1"),
    PokemonInfos(9, "Tortank", "sprite", "Eau", null, "85,5", "1,6"),
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
                onTap:() => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PokemonPage(
                        id: pokemon.id,
                        pokemonName: pokemon.pokemonName,
                        height: pokemon.height,
                        sprite: pokemon.sprite,
                        type1: pokemon.type1,
                        weight: pokemon.weight,
                        type2: pokemon.type2),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}