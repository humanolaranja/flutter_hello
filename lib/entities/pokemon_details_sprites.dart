class PokemonDetailsSprite {
  static String defaultImage = 'https://img.elo7.com.br/product/zoom/28E57D8/pokebola-eva.jpg';
  final String image;

  PokemonDetailsSprite({this.image});

  factory PokemonDetailsSprite.fromJson(Map<String, dynamic> json) {
    return PokemonDetailsSprite(
      image: json['front_default'] ?? defaultImage,
    );
  }
}
