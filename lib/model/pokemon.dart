class Pokemon {
  final String name;
  final int id;
  final String sprite;
  final String type1;
  final String? type2;
  final String weight;
  final String height;

  Pokemon({
    required this.id,
    required this.name,
    required this.sprite,
    required this.type1,
    required this.type2,
    required this.weight,
    required this.height,
  });
}
