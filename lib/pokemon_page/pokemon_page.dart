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
            Container(
              color: Colors.amber,
              height: 128,
              width: 128,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "#${pokemon.id}",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
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
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                const Spacer(),
                if (pokemon.type2 != null)
                  Text(
                    pokemon.type2!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
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
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                const Spacer(),
                Text(
                  "${pokemon.height} m",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
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
