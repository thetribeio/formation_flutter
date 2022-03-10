import 'package:flutter/material.dart';
import 'package:formation_flutter/pokemon_page/pokemon_page.dart';
import 'models/pokemon_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  List<PokemonInfos> pokemons = [
    PokemonInfos(1,"Bulbizarre",'https://img.pokemondb.net/sprites/x-y/normal/bulbasaur.png',"Plante","Poison","6,9","0,7"),
    PokemonInfos(2,"Herbizarre",'https://img.pokemondb.net/sprites/x-y/normal/ivysaur.png',"Plante","Poison","13","1"),
    PokemonInfos(3,"Florizarre",'https://img.pokemondb.net/sprites/x-y/normal/venusaur-f.png',"Plante","Poison","100","2"),
    PokemonInfos(4,"Salamèche",'https://img.pokemondb.net/sprites/x-y/normal/charmander.png',"Feu",null,"8,5", "0,6"),
    PokemonInfos(5,"Reptincel",'https://img.pokemondb.net/sprites/x-y/normal/charmeleon.png',"Feu",null,"19","1,1"),
    PokemonInfos(6,"Dracaufeu",'https://img.pokemondb.net/sprites/x-y/normal/charizard.png',"Feu","Vol", "90,5","1,7"),
    PokemonInfos(7,"Carapuce",'https://img.pokemondb.net/sprites/x-y/normal/squirtle.png',"Eau",null, "9","0,5"),
    PokemonInfos(8,"Carabaffe",'https://img.pokemondb.net/sprites/x-y/normal/wartortle.png',"Eau",null, "22,5 ","1"),
    PokemonInfos(9,"Tortank",'https://img.pokemondb.net/sprites/x-y/normal/blastoise.png',"Eau", null,"85,5","1,6"),
  ];
  //Ce widget est la racine de votre application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Composant principal de flutter, permet d'accéder à tous les autres composants du SDK Flutter
      home: Scaffold(
        //La classe Scaffold est un widget extensible qui remplit l'espace disponible et fournit les principaux widgets
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/pokeball.png',
                fit: BoxFit.contain,
                height: 32,
              ),
              const Text('Pokedex'),
            ],
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
                leading: Image(
                  image: NetworkImage(pokemon.sprite),
                ),
                tileColor: Colors.grey,
                title: Text(
                  pokemon.pokemonName,
                  style: const TextStyle(fontFamily: 'RobotoMono'),
                ),
                subtitle: Text("#${pokemon.id}"),
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


