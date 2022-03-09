import 'package:flutter/material.dart';
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.red,
          secondary: Colors.blue[900],
          background: const Color.fromARGB(255, 228, 228, 228),
          onBackground: Colors.grey[900],
          onPrimary: Colors.black,
          onSecondary: Colors.white,
        ),
      ),
      darkTheme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(255, 168, 46, 38),
          secondary: const Color.fromARGB(255, 8, 44, 99),
          background: const Color.fromARGB(255, 41, 41, 41),
          onBackground: Colors.white,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.white,
        ),
      ),
      themeMode: ThemeMode.system,
      home: Scaffold(
        //La classe Scaffold est un widget extensible qui remplit l'espace disponible et fournit les principaux widgets
        appBar: AppBar(
          title: Text(
            "Pokedex",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
        body: const PokemonPage(
          pokemonName: "pokemonName",
          id: "001",
          sprite: "sprite",
          type1: "type1",
          type2: "type2",
          weight: "weight",
          height: "height",
        ),
      ),
    );
  }
}
