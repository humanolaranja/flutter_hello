import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_hello/providers/pokemon_provider.dart';
import 'package:flutter_hello/entities/pokemon_entity.dart';
import 'package:flutter_hello/entities/pokemon_details_entity.dart';
import 'package:flutter_hello/entities/pokemon_details_sprites_entity.dart';

// Create a custom function for testing
Future<List<Pokemon>> mockFetchPokemons() async {
  return [
    Pokemon(name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/1/'),
    Pokemon(name: 'ivysaur', url: 'https://pokeapi.co/api/v2/pokemon/2/'),
  ];
}

Future<List<Pokemon>> mockFetchPokemonsError() async {
  throw Exception('Network error');
}

Future<PokemonDetails> mockFetchPokemon(String url) async {
  return PokemonDetails(
    sprites: PokemonDetailsSprite(image: 'test-image.png'),
  );
}

Future<PokemonDetails> mockFetchPokemonError(String url) async {
  throw Exception('Network error');
}

void main() {
  group('PokemonProvider', () {
    test('initial state should be empty with no loading or error', () {
      // Arrange & Act
      final provider = PokemonProvider();

      // Assert
      expect(provider.pokemons, isEmpty);
      expect(provider.isLoading, isFalse);
      expect(provider.error, isNull);
    });

    test('fetchAllPokemons should update state correctly on success', () async {
      // Arrange
      final provider = PokemonProvider(
        fetchPokemonsFunction: mockFetchPokemons,
      );

      // Act
      await provider.fetchAllPokemons();

      // Assert
      expect(provider.pokemons.length, 2);
      expect(provider.pokemons[0].name, 'bulbasaur');
      expect(provider.pokemons[1].name, 'ivysaur');
      expect(provider.isLoading, isFalse);
      expect(provider.error, isNull);
    });

    test('fetchAllPokemons should update error state on failure', () async {
      // Arrange
      final provider = PokemonProvider(
        fetchPokemonsFunction: mockFetchPokemonsError,
      );

      // Act
      await provider.fetchAllPokemons();

      // Assert
      expect(provider.pokemons, isEmpty);
      expect(provider.isLoading, isFalse);
      expect(provider.error, contains('Network error'));
    });

    test('getPokemonDetails should return pokemon details on success', () async {
      // Arrange
      const url = 'https://pokeapi.co/api/v2/pokemon/1/';
      final provider = PokemonProvider(
        fetchPokemonFunction: mockFetchPokemon,
      );

      // Act
      final result = await provider.getPokemonDetails(url);

      // Assert
      expect(result.sprites.image, 'test-image.png');
      expect(provider.error, isNull);
    });

    test('getPokemonDetails should throw exception and update error state on failure', () async {
      // Arrange
      const url = 'https://pokeapi.co/api/v2/pokemon/1/';
      final provider = PokemonProvider(
        fetchPokemonFunction: mockFetchPokemonError,
      );

      // Act & Assert
      expect(() => provider.getPokemonDetails(url), throwsException);

      // Wait for the async operation to complete
      await Future.delayed(Duration.zero);

      expect(provider.error, contains('Network error'));
    });

    test('clearError should reset error state', () async {
      // Arrange
      final provider = PokemonProvider(
        fetchPokemonsFunction: mockFetchPokemonsError,
      );

      // Act
      await provider.fetchAllPokemons();
      provider.clearError();

      // Assert
      expect(provider.error, isNull);
    });
  });
}
