import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_hello/entities/pokemon_details_sprites.dart';

void main() {
  group('PokemonDetailsSprite', () {
    test('should create PokemonDetailsSprite from json', () {
      // Arrange
      final json = {
        'front_default': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png'
      };

      // Act
      final sprite = PokemonDetailsSprite.fromJson(json);

      // Assert
      expect(sprite.image, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png');
    });

    test('should use default image when front_default is null', () {
      // Arrange
      final json = <String, dynamic>{};

      // Act
      final sprite = PokemonDetailsSprite.fromJson(json);

      // Assert
      expect(sprite.image, PokemonDetailsSprite.defaultImage);
    });
  });
}