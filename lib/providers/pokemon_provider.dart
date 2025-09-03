import 'package:flutter/material.dart';
import 'package:flutter_hello/entities/pokemon.dart';
import 'package:flutter_hello/entities/pokemon_details.dart';
import 'package:flutter_hello/service/pokemons.dart';

/// A ChangeNotifier that manages the state of Pokemon data
///
/// This provider handles loading Pokemon list, tracking the current Pokemon,
/// and managing loading states
class PokemonProvider extends ChangeNotifier {
  List<Pokemon> _pokemons = [];
  bool _isLoading = false;
  String? _error;

  // Getters
  List<Pokemon> get pokemons => _pokemons;
  bool get isLoading => _isLoading;
  String? get error => _error;

  /// Fetch all pokemons from the API
  Future<void> fetchAllPokemons() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _pokemons = await fetchPokemons();
    } catch (e) {
      _error = 'Failed to load Pokemons: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Get Pokemon details by URL
  Future<PokemonDetails> getPokemonDetails(String url) async {
    try {
      return await fetchPokemon(url);
    } catch (e) {
      _error = 'Failed to load Pokemon details: ${e.toString()}';
      notifyListeners();
      throw Exception(_error);
    }
  }

  /// Clear any errors
  void clearError() {
    _error = null;
    notifyListeners();
  }
}