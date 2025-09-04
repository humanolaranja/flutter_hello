import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:dio/dio.dart';
import 'package:flutter_hello/service/pokemons.dart';
import 'package:flutter_hello/entities/pokemon.dart';
import 'package:flutter_hello/entities/pokemon_details.dart';

// Generate mocks
@GenerateMocks([Dio])
import 'pokemons_test.mocks.dart';

void main() {
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
  });

  group('fetchPokemons', () {
    test('should return list of Pokemon when API call is successful', () async {
      // Arrange
      final responseData = {
        'results': [
          {'name': 'bulbasaur', 'url': 'https://pokeapi.co/api/v2/pokemon/1/'},
          {'name': 'ivysaur', 'url': 'https://pokeapi.co/api/v2/pokemon/2/'}
        ]
      };

      when(mockDio.get('https://pokeapi.co/api/v2/pokemon')).thenAnswer(
        (_) async => Response(
          data: responseData,
          statusCode: 200,
          requestOptions: RequestOptions(path: 'https://pokeapi.co/api/v2/pokemon'),
        ),
      );

      // Act
      final result = await fetchPokemons(dio: mockDio);

      // Assert
      expect(result, isA<List<Pokemon>>());
      expect(result.length, 2);
      expect(result[0].name, 'bulbasaur');
      expect(result[1].name, 'ivysaur');
    });

    test('should throw exception when API call fails', () async {
      // Arrange
      when(mockDio.get('https://pokeapi.co/api/v2/pokemon')).thenAnswer(
        (_) async => Response(
          statusCode: 404,
          requestOptions: RequestOptions(path: 'https://pokeapi.co/api/v2/pokemon'),
        ),
      );

      // Act & Assert
      expect(() => fetchPokemons(dio: mockDio), throwsException);
    });
  });

  group('fetchPokemon', () {
    const url = 'https://pokeapi.co/api/v2/pokemon/1/';
    
    test('should return PokemonDetails when API call is successful', () async {
      // Arrange
      final responseData = {
        'sprites': {
          'front_default': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png'
        }
      };

      when(mockDio.get(url)).thenAnswer(
        (_) async => Response(
          data: responseData,
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
        ),
      );

      // Act
      final result = await fetchPokemon(url, dio: mockDio);

      // Assert
      expect(result, isA<PokemonDetails>());
      expect(result.sprites.image, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png');
    });

    test('should throw exception when API call fails', () async {
      // Arrange
      when(mockDio.get(url)).thenAnswer(
        (_) async => Response(
          statusCode: 404,
          requestOptions: RequestOptions(path: url),
        ),
      );

      // Act & Assert
      expect(() => fetchPokemon(url, dio: mockDio), throwsException);
    });
  });
}