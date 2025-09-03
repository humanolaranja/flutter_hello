import 'package:dio/dio.dart';
import 'package:flutter_hello/entities/pokemon.dart';
import 'package:flutter_hello/entities/pokemon_details.dart';

Future<List<Pokemon>> fetchPokemons() async {
  final response = await Dio().get('https://pokeapi.co/api/v2/pokemon');

  if (response.statusCode == 200) {
    Map<String, dynamic> responseJson = response.data;
    List<dynamic> results = responseJson["results"];

    return results.map((m) => Pokemon.fromJson(m)).toList();
  } else {
    throw Exception('Failed to load pokemons');
  }
}

Future<PokemonDetails> fetchPokemon(String url) async {
  final response = await Dio().get(url);

  if (response.statusCode == 200) {
    return PokemonDetails.fromJson(response.data);
  } else {
    throw Exception('Failed to load pokemons');
  }
}
