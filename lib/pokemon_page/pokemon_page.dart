import 'package:flutter/material.dart';
import 'widgets/stats_bar_chart.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // On affiche ici l'image disponible à l'URL [pokemon.sprite]
              // [NetworkImage] se charge de télécharger l'image.
              Image(
                image: NetworkImage(pokemon.sprite),
                height: 128,
                width: 128,
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
              Card(
                child: StatsBarChart(
                  stats: pokemon.stats,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
