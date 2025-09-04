import 'package:flutter/material.dart';
import 'package:flutter_hello/screens/notifier_examples_page.dart';
import 'package:flutter_hello/screens/pokemon.dart';
import 'package:flutter_hello/screens/pokemons.dart';

class Routes {
  static const String pokemonPagePath = '/';
  static const String pokemonDetailsPagePath = '/pokemon';
  static const String notifierExamplesPath = '/notifier-examples';

  getDefault(args) {
    return {
      pokemonPagePath: (BuildContext context) => const PokemonsPage(),
      pokemonDetailsPagePath: (BuildContext context) => PokemonPage(args),
      notifierExamplesPath: (BuildContext context) => const NotifierExamplesPage(),
    };
  }
}
