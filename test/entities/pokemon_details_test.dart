import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_hello/entities/pokemon_details_entity.dart';

void main() {
  group('PokemonDetails', () {
    test('should create PokemonDetails from json', () {
      // Arrange
      final json = {
        'sprites': {'front_default': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png'}
      };

      // Act
      final details = PokemonDetails.fromJson(json);

      // Assert
      expect(details.sprites.image, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png');
    });

    test('should handle missing sprites in json', () {
      // Arrange
      final json = <String, dynamic>{};

      // Act & Assert
      expect(() => PokemonDetails.fromJson(json), throwsA(isA<TypeError>()));
    });
  });
}
