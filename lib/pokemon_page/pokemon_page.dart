import 'package:flutter/material.dart';

class PokemonPage extends StatelessWidget {
  final String pokemonName;
  final int id;
  final String sprite;
  final String type1;
  final String? type2;
  final String weight;
  final String height;
  const PokemonPage({
    Key? key,
    required this.pokemonName,
    required this.id,
    required this.sprite,
    required this.type1,
    this.type2,
    required this.weight,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pokemonName,
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
            Text("#$id"),
            const SizedBox(
              height: 8,
            ),
            const Spacer(),
            Row(
              children: [
                const Spacer(),
                Text(type1),
                const Spacer(),
                if (type2 != null) Text(type2!),
                if (type2 != null) const Spacer(),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                const Spacer(),
                Text("$weight Kg"),
                const Spacer(),
                Text("$height m"),
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
