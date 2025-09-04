import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_hello/entities/pokemon_entity.dart';
import 'package:flutter_hello/providers/favorite_pokemon_notifier.dart';
import 'package:flutter_hello/screens/pokemons.dart';

void main() {
  testWidgets('PokemonListItem displays pokemon name', (WidgetTester tester) async {
    // Arrange
    final pokemon = Pokemon(name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/1/');
    final favoriteNotifier = FavoritePokemonNotifier();

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChangeNotifierProvider<FavoritePokemonNotifier>.value(
            value: favoriteNotifier,
            child: PokemonListItem(pokemon: pokemon),
          ),
        ),
      ),
    );

    // Assert
    expect(find.text('bulbasaur'), findsOneWidget);
  });

  testWidgets('PokemonListItem toggles favorite status when tapped', (WidgetTester tester) async {
    // Arrange
    final pokemon = Pokemon(name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/1/');
    final favoriteNotifier = FavoritePokemonNotifier();

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChangeNotifierProvider<FavoritePokemonNotifier>.value(
            value: favoriteNotifier,
            child: PokemonListItem(pokemon: pokemon),
          ),
        ),
      ),
    );

    // Initial state - not favorite
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsNothing);

    // Tap the favorite button
    await tester.tap(find.byIcon(Icons.favorite_border));
    await tester.pump();

    // Should now be favorite
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border), findsNothing);

    // Tap again to toggle off
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pump();

    // Should be back to not favorite
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsNothing);
  });
}
