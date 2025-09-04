import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_hello/entities/pokemon_entity.dart';

void main() {
  group('Pokemon', () {
    test('should create Pokemon from json', () {
      // Arrange
      final json = {'name': 'bulbasaur', 'url': 'https://pokeapi.co/api/v2/pokemon/1/'};

      // Act
      final pokemon = Pokemon.fromJson(json);

      // Assert
      expect(pokemon.name, 'bulbasaur');
      expect(pokemon.url, 'https://pokeapi.co/api/v2/pokemon/1/');
    });

    test('should handle missing fields in json', () {
      // Arrange
      final json = {'name': 'bulbasaur'};

      // Act
      final pokemon = Pokemon.fromJson(json);

      // Assert
      expect(pokemon.name, 'bulbasaur');
      expect(pokemon.url, '');
    });

    test('should handle empty json', () {
      // Arrange
      final json = <String, dynamic>{};

      // Act
      final pokemon = Pokemon.fromJson(json);

      // Assert
      expect(pokemon.name, '');
      expect(pokemon.url, '');
    });
  });
}
