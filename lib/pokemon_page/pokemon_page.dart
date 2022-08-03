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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pokemon.name,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // TODO : remplacer le [Placeholder] par l'affichage de l'image
            // présente sur internet à l'URL [pokemon.sprite]
            const SizedBox(
              width: 128,
              height: 128,
              child: Placeholder(),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "#${pokemon.id}",
            ),
            const SizedBox(
              height: 8,
            ),
            const Spacer(),
            Row(
              children: [
                const Spacer(),
                Text(
                  pokemon.type1,
                ),
                const Spacer(),
                if (pokemon.type2 != null)
                  Text(
                    pokemon.type2!,
                  ),
                if (pokemon.type2 != null) const Spacer(),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                const Spacer(),
                Text(
                  "${pokemon.weight} Kg",
                ),
                const Spacer(),
                Text(
                  "${pokemon.height} m",
                ),
                const Spacer(),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
