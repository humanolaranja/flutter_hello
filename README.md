---
marp: true
theme: uncover
class: invert
---

# Hello World com Flutter 🌎

# O que é Flutter?
#### "Flutter is Google's UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase."

---

## Como funciona? 🤔
![height:500px](assets/readme/how.jpg)

---

## Comparação 📈
![height:300px](assets/readme/fluttervshtml.png)

---

## Código 🖥️
#### Pokedex!
![height:300px](assets/readme/pokebola.jpg)

---

## Gerenciamento de Estado 📊

Flutter oferece várias formas de gerenciar estado:

- **ChangeNotifier**: Para estados complexos
- **ValueNotifier**: Para estados simples
- **Provider**: Para injeção de dependências

---

## ChangeNotifier 🔄

```dart
class PokemonProvider extends ChangeNotifier {
  List<Pokemon> _pokemons = [];
  
  void addPokemon(Pokemon pokemon) {
    _pokemons.add(pokemon);
    notifyListeners();
  }
}
```

---

## ValueNotifier 💎

```dart
// Criação
final counter = ValueNotifier<int>(0);

// Uso
ValueListenableBuilder<int>(
  valueListenable: counter,
  builder: (context, value, child) {
    return Text('$value');
  },
)

// Atualização
counter.value++;
```

---

Referências
- [Flutter Page](https://flutter.dev/)
- [Flutter Docs](https://flutter.dev/docs)
- [Basic Widgets](https://flutter.dev/docs/development/ui/widgets/basics)
- [HTTP Package](https://pub.dev/packages/http)
- [Provider Package](https://pub.dev/packages/provider)

---

Perguntas?

![height:500px](assets/readme/questions.gif)

---

Valeu!

![height:500px](assets/readme/tks.gif)

---
- [Repositório](https://github.com/humanolaranja/flutter_hello)