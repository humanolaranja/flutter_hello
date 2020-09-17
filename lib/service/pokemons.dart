import 'package:flutter_hello/entities/pokemon.dart';
import 'package:flutter_hello/entities/pokemon_details.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Pokemon>> fetchPokemons() async {
  final response = await http.get('https://pokeapi.co/api/v2/pokemon');

  if (response.statusCode == 200) {
    List<dynamic> responseJson = json.decode(response.body)['results'];

    return responseJson.map((m) => Pokemon.fromJson(m)).toList();
  } else {
    throw Exception('Failed to load pokemons');
  }
}

Future<PokemonDetails> fetchPokemon(String url) async {
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return PokemonDetails.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load pokemons');
  }
}
