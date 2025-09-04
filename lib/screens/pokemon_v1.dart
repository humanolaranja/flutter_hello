import 'package:flutter/material.dart';
import 'package:flutter_hello/entities/pokemon_entity.dart';
import 'package:flutter_hello/entities/pokemon_details_entity.dart';
import 'package:flutter_hello/service/pokemon_service.dart';

class PokemonPage extends StatefulWidget {
  final Pokemon pokemon;
  const PokemonPage(this.pokemon, {Key? key}) : super(key: key);

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  late Future<PokemonDetails> futurePokemon;

  @override
  void initState() {
    super.initState();
    futurePokemon = fetchPokemon(widget.pokemon.url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokemon.name),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<PokemonDetails>(
                future: futurePokemon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Image.network(
                      snapshot.data!.sprites.image,
                      height: 100,
                      fit: BoxFit.fitWidth,
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return const CircularProgressIndicator();
                }),
            Hero(
              tag: widget.pokemon.name,
              child: Material(
                child: Text(
                  widget.pokemon.name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
