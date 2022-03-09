import 'package:flutter/material.dart';
import 'package:formation_flutter/pokemon_info.dart';
import 'package:formation_flutter/pokemon_page/pokemon_page.dart';

void main() {
  runApp(const MyApp());
}

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
        body: ListView.builder(
          itemCount: pokemons.length,
          itemBuilder: (BuildContext context, int index) {
            final pokemon = pokemons[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Theme.of(context).colorScheme.surface,
                title: Text(
                  pokemon.pokemonName,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                subtitle: Text(
                  "#${pokemon.id}",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                onTap: () => Navigator.push(
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
