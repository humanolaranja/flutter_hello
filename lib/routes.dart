import 'package:flutter/material.dart';
import 'package:flutter_hello/screens/pokemon.dart';
import 'package:flutter_hello/screens/pokemons.dart';

class Routes {
  static final String pokemonPagePath = '/';
  static final String pokemonDetailsPagePath = '/pokemon';

  getDefault(args) {
    return {
      pokemonPagePath: (BuildContext context) => PokemonsPage(),
      pokemonDetailsPagePath: (BuildContext context) => PokemonPage(args),
    };
  }
}
