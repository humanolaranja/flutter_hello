import 'package:flutter_hello/entities/pokemon_details_sprites.dart';

class PokemonDetails {
  final PokemonDetailsSprite sprites;

  PokemonDetails({this.sprites});

  factory PokemonDetails.fromJson(Map<String, dynamic> json) {
    return PokemonDetails(
      sprites: PokemonDetailsSprite.fromJson(json['sprites']) ??
          PokemonDetailsSprite(
            image: PokemonDetailsSprite.defaultImage,
          ),
    );
  }
}
