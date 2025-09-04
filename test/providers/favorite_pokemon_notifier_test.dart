import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_hello/providers/favorite_pokemon_notifier.dart';
import 'package:flutter_hello/entities/pokemon_entity.dart';

void main() {
  late FavoritePokemonNotifier notifier;
  final pokemon1 = Pokemon(name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/1/');
  final pokemon2 = Pokemon(name: 'ivysaur', url: 'https://pokeapi.co/api/v2/pokemon/2/');

  setUp(() {
    notifier = FavoritePokemonNotifier();
  });

  group('FavoritePokemonNotifier', () {
    test('initial state should be empty', () {
      expect(notifier.value, isEmpty);
    });

    test('addFavorite should add pokemon to favorites', () {
      // Act
      notifier.addFavorite(pokemon1);

      // Assert
      expect(notifier.value.length, 1);
      expect(notifier.value[0].name, 'bulbasaur');
    });

    test('addFavorite should not add duplicate pokemon', () {
      // Arrange
      notifier.addFavorite(pokemon1);

      // Act
      notifier.addFavorite(pokemon1);

      // Assert
      expect(notifier.value.length, 1);
    });

    test('removeFavorite should remove pokemon from favorites', () {
      // Arrange
      notifier.addFavorite(pokemon1);
      notifier.addFavorite(pokemon2);

      // Act
      notifier.removeFavorite(pokemon1);

      // Assert
      expect(notifier.value.length, 1);
      expect(notifier.value[0].name, 'ivysaur');
    });

    test('toggleFavorite should add pokemon if not in favorites', () {
      // Act
      notifier.toggleFavorite(pokemon1);

      // Assert
      expect(notifier.value.length, 1);
      expect(notifier.value[0].name, 'bulbasaur');
    });

    test('toggleFavorite should remove pokemon if already in favorites', () {
      // Arrange
      notifier.addFavorite(pokemon1);

      // Act
      notifier.toggleFavorite(pokemon1);

      // Assert
      expect(notifier.value, isEmpty);
    });

    test('isFavorite should return true if pokemon is in favorites', () {
      // Arrange
      notifier.addFavorite(pokemon1);

      // Act & Assert
      expect(notifier.isFavorite(pokemon1), isTrue);
      expect(notifier.isFavorite(pokemon2), isFalse);
    });
  });
}
