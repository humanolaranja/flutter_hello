import 'package:flutter/material.dart';
import 'package:flutter_hello/providers/favorite_pokemon_notifier.dart';
import 'package:flutter_hello/providers/pokemon_provider.dart';
import 'package:flutter_hello/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PokemonProvider()),
        ChangeNotifierProvider(create: (_) => FavoritePokemonNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex Flutter',
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.light,
      ),
      initialRoute: Routes.pokemonPagePath,
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder = Routes().getDefault(settings.arguments)[settings.name];
        return MaterialPageRoute(builder: (context) => builder(context));
      },
    );
  }
}
