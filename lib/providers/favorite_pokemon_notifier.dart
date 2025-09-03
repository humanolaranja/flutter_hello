import 'package:flutter/material.dart';
import 'package:flutter_hello/entities/pokemon.dart';

/// A ValueNotifier that manages favorite Pokemon
///
/// This demonstrates the use of ValueNotifier for simpler state management
/// when you only need to track a single value
class FavoritePokemonNotifier extends ValueNotifier<List<Pokemon>> {
  FavoritePokemonNotifier() : super([]);

  /// Add a Pokemon to favorites
  void addFavorite(Pokemon pokemon) {
    // Check if the Pokemon is already in favorites
    if (!value.any((element) => element.name == pokemon.name)) {
      final newList = List<Pokemon>.from(value);
      newList.add(pokemon);
      value = newList;
    }
  }

  /// Remove a Pokemon from favorites
  void removeFavorite(Pokemon pokemon) {
    final newList = List<Pokemon>.from(value);
    newList.removeWhere((element) => element.name == pokemon.name);
    value = newList;
  }

  /// Toggle favorite status of a Pokemon
  void toggleFavorite(Pokemon pokemon) {
    if (isFavorite(pokemon)) {
      removeFavorite(pokemon);
    } else {
      addFavorite(pokemon);
    }
  }

  /// Check if a Pokemon is in favorites
  bool isFavorite(Pokemon pokemon) {
    return value.any((element) => element.name == pokemon.name);
  }
}