import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_hello/entities/pokemon_entity.dart';
import 'package:flutter_hello/entities/pokemon_details_entity.dart';
import 'package:flutter_hello/entities/pokemon_details_sprites_entity.dart';
import 'package:flutter_hello/providers/pokemon_provider.dart';
import 'package:flutter_hello/providers/favorite_pokemon_notifier.dart';
import 'package:flutter_hello/screens/pokemons.dart';
import 'package:flutter_hello/routes.dart';

// Custom mock provider that extends ChangeNotifier
class MockPokemonProvider extends ChangeNotifier implements PokemonProvider {
  bool _isLoading = false;
  String? _error;
  List<Pokemon> _pokemons = [];

  @override
  bool get isLoading => _isLoading;

  @override
  String? get error => _error;

  @override
  List<Pokemon> get pokemons => _pokemons;

  void setPokemons(List<Pokemon> pokemons) {
    _pokemons = pokemons;
    notifyListeners();
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void setError(String? error) {
    _error = error;
    notifyListeners();
  }

  @override
  Future<void> fetchAllPokemons() async {
    // This is mocked, so we don't need to implement it
  }

  @override
  Future<PokemonDetails> getPokemonDetails(String url) async {
    return PokemonDetails(sprites: PokemonDetailsSprite(image: 'test-image.png'));
  }

  @override
  void clearError() {
    _error = null;
    notifyListeners();
  }
}

void main() {
  testWidgets('PokemonsPage shows loading indicator when loading', (WidgetTester tester) async {
    // Arrange
    final mockProvider = MockPokemonProvider();
    mockProvider.setLoading(true);
    final favoriteNotifier = FavoritePokemonNotifier();

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider<PokemonProvider>.value(value: mockProvider),
            ChangeNotifierProvider<FavoritePokemonNotifier>.value(value: favoriteNotifier),
          ],
          child: const PokemonsPage(),
        ),
      ),
    );

    // Assert
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('PokemonsPage shows error message when there is an error', (WidgetTester tester) async {
    // Arrange
    final mockProvider = MockPokemonProvider();
    mockProvider.setError('Failed to load pokemons');
    final favoriteNotifier = FavoritePokemonNotifier();

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider<PokemonProvider>.value(value: mockProvider),
            ChangeNotifierProvider<FavoritePokemonNotifier>.value(value: favoriteNotifier),
          ],
          child: const PokemonsPage(),
        ),
      ),
    );

    // Assert
    expect(find.text('Failed to load pokemons'), findsOneWidget);
    expect(find.text('Retry'), findsOneWidget);
  });

  testWidgets('PokemonsPage shows list of pokemons when loaded', (WidgetTester tester) async {
    // Arrange
    final mockProvider = MockPokemonProvider();
    mockProvider.setPokemons([
      Pokemon(name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/1/'),
      Pokemon(name: 'ivysaur', url: 'https://pokeapi.co/api/v2/pokemon/2/'),
    ]);
    final favoriteNotifier = FavoritePokemonNotifier();

    // Act
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          Routes.pokemonDetailsPagePath: (context) => const Scaffold(body: Text('Pokemon Details')),
        },
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider<PokemonProvider>.value(value: mockProvider),
            ChangeNotifierProvider<FavoritePokemonNotifier>.value(value: favoriteNotifier),
          ],
          child: const PokemonsPage(),
        ),
      ),
    );

    // Assert
    expect(find.text('bulbasaur'), findsOneWidget);
    expect(find.text('ivysaur'), findsOneWidget);
  });

  testWidgets('PokemonsPage shows empty message when no pokemons', (WidgetTester tester) async {
    // Arrange
    final mockProvider = MockPokemonProvider();
    mockProvider.setPokemons([]);
    final favoriteNotifier = FavoritePokemonNotifier();

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider<PokemonProvider>.value(value: mockProvider),
            ChangeNotifierProvider<FavoritePokemonNotifier>.value(value: favoriteNotifier),
          ],
          child: const PokemonsPage(),
        ),
      ),
    );

    // Assert
    expect(find.text('No Pokemons found'), findsOneWidget);
  });
}
