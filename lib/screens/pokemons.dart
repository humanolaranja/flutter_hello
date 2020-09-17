import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hello/entities/pokemon.dart';
import 'package:flutter_hello/routes.dart';
import 'package:flutter_hello/service/pokemons.dart';

class PokemonsPage extends StatefulWidget {
  PokemonsPage({Key key}) : super(key: key);

  @override
  _PokemonsPageState createState() => _PokemonsPageState();
}

class _PokemonsPageState extends State<PokemonsPage> {
  Future<List<Pokemon>> futurePokemon;

  @override
  void initState() {
    super.initState();
    futurePokemon = fetchPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemons'),
      ),
      body: Center(
        child: FutureBuilder<List<Pokemon>>(
          future: futurePokemon,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    Pokemon item = snapshot.data[index];

                    return Card(
                        child: Padding(
                      padding: EdgeInsets.all(32),
                      child: Container(
                        child: GestureDetector(
                          onTap: () => Navigator.pushNamed(context, Routes.pokemonDetailsPagePath, arguments: Pokemon(name: item.name, url: item.url)),
                          child: Hero(
                            tag: item.name,
                            child: Material(
                              child: Text(
                                item.name,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                        alignment: Alignment.center,
                      ),
                    ));
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
