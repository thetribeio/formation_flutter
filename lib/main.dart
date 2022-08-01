import 'package:flutter/material.dart';
import 'package:formation_flutter/pokemons_page/pokemons_page.dart';

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
          title: const Align(
            child: Text("Pokedex"),
          ),
          backgroundColor: Colors.red,
        ),
        body: const PokemonsPage(),
      ),
    );
  }
}
