class PokemonDetailsSprite {
  static String defaultImage =
      'https://www.clipartmax.com/png/small/129-1298328_pokeball-pokemon-ball-hd-images-free-png-image-pokebola-png.png';
  final String image;

  PokemonDetailsSprite({required this.image});

  factory PokemonDetailsSprite.fromJson(Map<String, dynamic> json) {
    return PokemonDetailsSprite(
      image: json['front_default'] ?? defaultImage,
    );
  }
}
