import 'package:flutter/material.dart';
import 'package:flutter_hello/entities/pokemon.dart';
import 'package:flutter_hello/entities/pokemon_details.dart';
import 'package:flutter_hello/providers/favorite_pokemon_notifier.dart';
import 'package:flutter_hello/providers/pokemon_provider.dart';
import 'package:provider/provider.dart';

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
    // Use the provider to fetch pokemon details
    futurePokemon = context.read<PokemonProvider>().getPokemonDetails(widget.pokemon.url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokemon.name),
        actions: [
          // Use ValueListenableBuilder to update the favorite button state
          ValueListenableBuilder<List<Pokemon>>(
            valueListenable: context.read<FavoritePokemonNotifier>(),
            builder: (context, favorites, _) {
              final isFavorite = favorites.any((p) => p.name == widget.pokemon.name);

              return IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : null,
                ),
                onPressed: () {
                  context.read<FavoritePokemonNotifier>().toggleFavorite(widget.pokemon);
                },
              );
            },
          ),
        ],
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
                      height: 200,
                      fit: BoxFit.fitWidth,
                    );
                  } else if (snapshot.hasError) {
                    return Column(
                      children: [
                        Text('Error: ${snapshot.error}'),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              futurePokemon = context.read<PokemonProvider>().getPokemonDetails(widget.pokemon.url);
                            });
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    );
                  }
                  return const CircularProgressIndicator();
                }),
            const SizedBox(height: 20),
            Hero(
              tag: widget.pokemon.name,
              child: Material(
                child: Text(
                  widget.pokemon.name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Display favorite status with ValueListenableBuilder
            ValueListenableBuilder<List<Pokemon>>(
              valueListenable: context.read<FavoritePokemonNotifier>(),
              builder: (context, favorites, _) {
                final isFavorite = favorites.any((p) => p.name == widget.pokemon.name);

                return Text(
                  isFavorite ? 'Added to Favorites' : 'Not in Favorites',
                  style: TextStyle(
                    color: isFavorite ? Colors.red : Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
