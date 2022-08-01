import 'package:flutter/material.dart';
import 'package:formation_flutter/model/pokemon.dart';

/// Un écran affichant les informations au sujet
/// d'un [Pokemon]
class PokemonPage extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Pour le moment, on affiche seulement l'identifiant du [Pokemon]
    // A vous d'ajouter l'affichage des autres informations
    return Center(
      child: Text("${pokemon.id}"),
    );
  }
}
