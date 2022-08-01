import 'package:flutter/material.dart';
import 'package:formation_flutter/model/pokemon.dart';

class PokemonPage extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("${pokemon.id}"),
    );
  }
}
