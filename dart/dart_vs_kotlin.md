# Comparativo entre Dart e Kotlin

Este documento apresenta um comparativo entre as linguagens Dart (usada no Flutter) e Kotlin (usada no desenvolvimento Android nativo), destacando as principais semelhanças e diferenças.

## Declaração de Variáveis

| Característica | Dart | Kotlin |
|---------------|------|--------|
| Variável imutável | `final name = 'Flutter';` | `val name = "Flutter"` |
| Constante de compilação | `const pi = 3.14;` | `const val PI = 3.14` |
| Variável mutável | `var count = 0;` ou `int count = 0;` | `var count = 0` ou `var count: Int = 0` |
| Inferência de tipo | `var name = 'Flutter';` | `val name = "Flutter"` |
| Declaração explícita | `String name = 'Flutter';` | `val name: String = "Flutter"` |
| Inicialização tardia | `late String name;` | `lateinit var name: String` |

## Null Safety

| Característica | Dart | Kotlin |
|---------------|------|--------|
| Tipo anulável | `String? name;` | `var name: String?` |
| Tipo não-anulável | `String name = 'Flutter';` | `var name: String = "Flutter"` |
| Operador de acesso seguro | `name?.length` | `name?.length` |
| Operador de coalescência nula | `name ?? 'Default'` | `name ?: "Default"` |
| Assertion não-nulo | `name!.length` | `name!!.length` |

## Coleções

| Característica | Dart | Kotlin |
|---------------|------|--------|
| Lista | `var list = <int>[1, 2, 3];` | `val list = listOf(1, 2, 3)` |
| Lista mutável | `var list = <int>[1, 2, 3];` | `val list = mutableListOf(1, 2, 3)` |
| Map | `var map = {'a': 1, 'b': 2};` | `val map = mapOf("a" to 1, "b" to 2)` |
| Set | `var set = {1, 2, 3};` | `val set = setOf(1, 2, 3)` |

## Estruturas de Controle

| Característica | Dart | Kotlin |
|---------------|------|--------|
| Condicional | `if (x > 0) {...} else {...}` | `if (x > 0) {...} else {...}` |
| Operador ternário | `var result = x > 0 ? 'Positivo' : 'Não positivo';` | `val result = if (x > 0) "Positivo" else "Não positivo"` |
| Switch/When | `switch (value) { case 1: ... break; default: ... }` | `when (value) { 1 -> ... else -> ... }` |
| Loop for | `for (var i = 0; i < 5; i++) {...}` | `for (i in 0 until 5) {...}` |
| Loop for-in | `for (var item in items) {...}` | `for (item in items) {...}` |
| Loop while | `while (condition) {...}` | `while (condition) {...}` |

## Funções

| Característica | Dart | Kotlin |
|---------------|------|--------|
| Função básica | `int sum(int a, int b) { return a + b; }` | `fun sum(a: Int, b: Int): Int { return a + b }` |
| Função de uma linha | `int sum(int a, int b) => a + b;` | `fun sum(a: Int, b: Int): Int = a + b` |
| Parâmetros opcionais | `String greet(String name, [String? title]) {...}` | `fun greet(name: String, title: String? = null): String {...}` |
| Parâmetros nomeados | `void func({required String name, int? age}) {...}` | `fun func(name: String, age: Int? = null) {...}` |
| Chamada com parâmetros nomeados | `func(name: 'John', age: 30);` | `func(name = "John", age = 30)` |

## Classes e Objetos

| Característica | Dart | Kotlin |
|---------------|------|--------|
| Declaração de classe | `class Person { String name; int age; }` | `class Person(var name: String, var age: Int)` |
| Construtor | `Person(this.name, this.age);` | Implícito nos parâmetros da classe |
| Construtor nomeado | `Person.guest() : name = 'Guest', age = 0;` | `constructor() : this("Guest", 0)` |
| Herança | `class Employee extends Person {...}` | `class Employee : Person {...}` |
| Interface | `abstract class Vehicle { void start(); }` | `interface Vehicle { fun start() }` |
| Implementação | `class Car implements Vehicle {...}` | `class Car : Vehicle {...}` |
| Mixins | `class LoggedCar extends Car with Logger {...}` | Usa interfaces com implementações padrão |

## Programação Assíncrona

| Característica | Dart | Kotlin |
|---------------|------|--------|
| Função assíncrona | `Future<void> fetchData() async {...}` | `suspend fun fetchData() {...}` |
| Aguardar resultado | `await fetchData();` | `fetchData()` (dentro de contexto de coroutine) |
| Tratamento de erro | `try { await func(); } catch (e) {...}` | `try { func() } catch (e: Exception) {...}` |
| Lançar tarefa paralela | `Future(() { ... });` | `launch { ... }` |

## Principais Diferenças

1. **Sintaxe de Declaração**:
   - Dart usa ponto e vírgula no final das instruções, Kotlin não exige
   - Dart usa `var`, `final` e `const`, Kotlin usa `var` e `val`

2. **Strings**:
   - Dart: Aspas simples ou duplas (`'texto'` ou `"texto"`)
   - Kotlin: Aspas duplas (`"texto"`)

3. **Interpolação de Strings**:
   - Dart: `"Nome: $name, Idade: ${person.age}"`
   - Kotlin: `"Nome: $name, Idade: ${person.age}"`

4. **Coleções**:
   - Dart: Coleções são mutáveis por padrão
   - Kotlin: Coleções são imutáveis por padrão, precisa usar `mutableListOf()`, etc.

5. **Programação Assíncrona**:
   - Dart: Usa `async`/`await` com `Future`
   - Kotlin: Usa coroutines com funções `suspend`

6. **Classes**:
   - Dart: Construtores e propriedades são declarados separadamente
   - Kotlin: Propriedades podem ser declaradas diretamente no construtor primário

7. **Interfaces**:
   - Dart: Usa classes abstratas como interfaces
   - Kotlin: Tem palavra-chave `interface` específica

8. **Mixins**:
   - Dart: Palavra-chave `with` para mixins
   - Kotlin: Usa interfaces com implementações padrão

## Conclusão

Dart e Kotlin são linguagens modernas com muitas semelhanças, o que facilita a transição de desenvolvedores Kotlin para Flutter. Ambas possuem:

- Tipagem forte
- Null safety
- Sintaxe concisa
- Suporte a programação funcional
- Programação assíncrona
- Orientação a objetos

As principais diferenças estão na sintaxe específica e nos mecanismos de programação assíncrona, mas os conceitos fundamentais são bastante similares.