import 'package:flutter/material.dart';
import 'package:formation_flutter/model/pokemon.dart';
import 'package:formation_flutter/pokemon_page/pokemon_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //Ce widget est la racine de votre application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Composant principal de flutter, permet d'accéder à tous les autres composants du SDK Flutter
      home: Scaffold(
        //La classe Scaffold est un widget extensible qui remplit l'espace disponible et fournit les principaux widgets
        appBar: AppBar(
          title: const Text("Pokedex"),
        ),
        body: PokemonPage(
          pokemon: Pokemon(
            id: 1,
            name: "Bulbizarre",
            sprite: "sprite",
            type1: "Plante",
            type2: "Poison",
            weight: 6.9,
            height: 0.7,
          ),
        ),
      ),
    );
  }
}
