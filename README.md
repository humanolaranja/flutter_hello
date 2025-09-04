---
marp: true
theme: uncover
class: invert

---

## Linguagem utilizada

Dart

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
- [DartPad](https://dartpad.dev/?sample=fibonacci)
- [Flutter Archive](https://docs.flutter.dev/install/archive)
- [Flutter Install](https://docs.flutter.dev/install/manual)
- [Widgets Catalog](https://docs.flutter.dev/reference/widgets)
- [Widget of the week](https://www.youtube.com/playlist?list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG)
- [PokeApi](https://pokeapi.co/)
- [Dio Package](https://pub.dev/packages/dio)



---

Perguntas?

![height:500px](assets/readme/questions.gif)

---

Valeu!

![height:500px](assets/readme/tks.gif)

---
- [Repositório](https://github.com/humanolaranja/flutter_hello)