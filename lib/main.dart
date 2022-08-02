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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.red,
          secondary: Colors.blue[900],
          background: const Color.fromARGB(255, 228, 228, 228),
          surface: Colors.grey[100],
          onBackground: Colors.grey[900],
          onPrimary: Colors.black,
          onSecondary: Colors.white,
          onSurface: Colors.black,
        ),
      ),
      darkTheme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.red,
          secondary: Colors.blue[900],
          background: const Color.fromARGB(255, 41, 41, 41),
          surface: Colors.grey[800],
          onBackground: Colors.white,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.white,
        ),
      ),
      themeMode: ThemeMode.dark,
      // Composant principal de flutter, permet d'accéder à tous les autres composants du SDK Flutter
      home: Scaffold(
        //La classe Scaffold est un widget extensible qui remplit l'espace disponible et fournit les principaux widgets
        appBar: AppBar(
          title: Align(
            child: Text(
              "Pokedex",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
        body: const PokemonsPage(),
      ),
    );
  }
}
