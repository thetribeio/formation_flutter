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
    return const MaterialApp(
      // Composant principal de flutter, permet d'accéder à tous les autres composants du SDK Flutter
      home: PokemonsPage(),
    );
  }
}
