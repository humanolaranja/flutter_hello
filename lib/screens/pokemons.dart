import 'package:flutter/material.dart';
import 'package:flutter_hello/entities/pokemon.dart';
import 'package:flutter_hello/providers/favorite_pokemon_notifier.dart';
import 'package:flutter_hello/providers/pokemon_provider.dart';
import 'package:flutter_hello/routes.dart';
import 'package:provider/provider.dart';

class PokemonsPage extends StatefulWidget {
  PokemonsPage({Key? key}) : super(key: key);

  @override
  _PokemonsPageState createState() => _PokemonsPageState();
}

class _PokemonsPageState extends State<PokemonsPage> {
  @override
  void initState() {
    super.initState();
    // Use the provider to fetch pokemons when the screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PokemonProvider>().fetchAllPokemons();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemons'),
        actions: [
          // Display count of favorite pokemons using ValueNotifier
          ValueListenableBuilder<List<Pokemon>>(
            valueListenable: context.read<FavoritePokemonNotifier>(),
            builder: (context, favorites, _) {
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Row(
                  children: [
                    Icon(Icons.favorite),
                    SizedBox(width: 4),
                    Text('${favorites.length}'),
                  ],
                ),
              );
            },
          ),
          // Add button to navigate to examples page
          IconButton(
            icon: Icon(Icons.school),
            tooltip: 'State Management Examples',
            onPressed: () => Navigator.pushNamed(context, Routes.notifierExamplesPath),
          ),
        ],
      ),
      body: Consumer<PokemonProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (provider.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(provider.error!),
                  ElevatedButton(
                    onPressed: () => provider.fetchAllPokemons(),
                    child: Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (provider.pokemons.isEmpty) {
            return Center(child: Text('No Pokemons found'));
          }

          return ListView.builder(
            itemCount: provider.pokemons.length,
            itemBuilder: (context, index) {
              Pokemon item = provider.pokemons[index];

              return PokemonListItem(pokemon: item);
            },
          );
        },
      ),
    );
  }
}

class PokemonListItem extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonListItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use ValueListenableBuilder to listen to changes in favorites
    return ValueListenableBuilder<List<Pokemon>>(
      valueListenable: context.read<FavoritePokemonNotifier>(),
      builder: (context, favorites, _) {
        final isFavorite = favorites.any((p) => p.name == pokemon.name);

        return Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      Routes.pokemonDetailsPagePath,
                      arguments: pokemon,
                    ),
                    child: Hero(
                      tag: pokemon.name,
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          pokemon.name,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                ),
                // Add favorite button
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : null,
                  ),
                  onPressed: () {
                    context.read<FavoritePokemonNotifier>().toggleFavorite(pokemon);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
