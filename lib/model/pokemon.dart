class Pokemon {
  final int id;
  final String name;
  final String sprite;
  final String type1;
  final String? type2;
  final double weight;
  final double height;

  const Pokemon({
    required this.id,
    required this.name,
    required this.sprite,
    required this.type1,
    required this.type2,
    required this.weight,
    required this.height,
  });
}
