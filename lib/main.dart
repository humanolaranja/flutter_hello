import 'package:flutter/material.dart';
import 'package:flutter_hello/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokeDextra Flutter',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.pokemonPagePath,
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder = Routes().getDefault(settings.arguments)[settings.name];
        return MaterialPageRoute(builder: (ctx) => builder(ctx));
      },
    );
  }
}
