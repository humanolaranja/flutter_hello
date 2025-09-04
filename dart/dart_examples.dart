// ignore_for_file: unused_local_variable, avoid_print, avoid_function_literals_in_foreach_calls, avoid_init_to_null

void variablesAndTypes() {
  // Declaração com tipo explícito
  String name = 'Flutter';
  int age = 5;
  double height = 1.75;
  bool isAwesome = true;

  // Inferência de tipo com 'var'
  var language = 'Dart'; // String
  var version = 2.19; // double
  var isStronglyTyped = true; // bool

  // Constantes
  final currentYear = 2023; // não pode ser reatribuído
  const pi = 3.14159; // constante de compilação

  // Null safety
  String? nullableName = null; // pode ser nulo
  String nonNullableName = 'Required'; // não pode ser nulo

  // Late initialization
  late String lateInitialized;
  // ... algum código ...
  lateInitialized = 'Inicializado depois';

  print('Variáveis em Dart: $name.name, $age, $height, $isAwesome');
  print('Inferência: $language, $version, $isStronglyTyped');
}

// ===== COLEÇÕES =====

void collections() {
  // Listas
  List<String> fruits = ['Apple', 'Banana', 'Orange'];
  var numbers = <int>[1, 2, 3, 4, 5];

  // Lista imutável
  final constList = const [1, 2, 3];

  // Operações com listas
  fruits.add('Mango');
  fruits.remove('Apple');
  fruits.forEach((fruit) => print(fruit));

  // Map (dicionário)
  Map<String, int> ages = {
    'Alice': 30,
    'Bob': 25,
    'Charlie': 35,
  };

  // Operações com maps
  ages['David'] = 40;
  print('Bob tem ${ages['Bob']} anos');

  // Set
  Set<int> uniqueNumbers = {1, 2, 3, 4}; // {1, 2, 3, 4}
  uniqueNumbers.add(5);
  print('Contém 3? ${uniqueNumbers.contains(3)}');
}

// ===== ESTRUTURAS DE CONTROLE =====

void controlStructures() {
  // If-else
  int x = 10;
  if (x > 5) {
    print('x é maior que 5');
  } else if (x == 5) {
    print('x é igual a 5');
  } else {
    print('x é menor que 5');
  }

  // Operador ternário
  String result = x > 5 ? 'maior que 5' : 'menor ou igual a 5';

  // Switch
  String fruit = 'Apple';
  switch (fruit) {
    case 'Apple':
      print('É uma maçã');
      break;
    case 'Banana':
      print('É uma banana');
      break;
    default:
      print('É outra fruta');
  }

  // For loop
  for (int i = 0; i < 5; i++) {
    print('Índice: $i');
  }

  // For-in loop (para coleções)
  List<String> names = ['Alice', 'Bob', 'Charlie'];
  for (var name in names) {
    print('Nome: $name');
  }

  // While loop
  int count = 0;
  while (count < 3) {
    print('Contagem: $count');
    count++;
  }

  // Do-while loop
  int y = 0;
  do {
    print('y é $y');
    y++;
  } while (y < 3);
}

// ===== FUNÇÕES =====

// Função com tipo de retorno e parâmetros tipados
int sum(int a, int b) {
  return a + b;
}

// Função com parâmetros opcionais posicionais
String greet(String name, [String? title]) {
  return title != null ? 'Hello $title $name' : 'Hello $name';
}

// Função com parâmetros nomeados
void printPersonInfo({required String name, int? age, String country = 'Brasil'}) {
  print('Nome: $name, Idade: ${age ?? 'N/A'}, País: $country');
}

// Arrow function (função de uma linha)
int multiply(int a, int b) => a * b;

// Função anônima (lambda)
void functionsExample() {
  var numbers = [1, 2, 3, 4, 5];

  // Usando função anônima
  numbers.forEach((number) {
    print(number * 2);
  });

  // Versão mais curta com arrow function
  numbers.forEach((n) => print(n * 3));

  // Função como parâmetro
  int Function(int, int) operation = sum;
  print('Resultado: ${operation(5, 3)}');
}

// ===== CLASSES E OBJETOS =====

// Classe básica
class Person {
  // Propriedades
  String name;
  int age;

  // Construtor
  Person(this.name, this.age);

  // Construtor nomeado
  Person.guest()
      : name = 'Guest',
        age = 0;

  // Método
  void introduce() {
    print('Olá, meu nome é $name e tenho $age anos.');
  }

  // Getter
  String get description => '$name, $age anos';

  // Setter
  set setAge(int value) {
    if (value >= 0) {
      age = value;
    }
  }
}

// Herança
class Employee extends Person {
  String company;

  Employee(super.name, super.age, this.company);

  @override
  void introduce() {
    super.introduce();
    print('Eu trabalho na $company.');
  }
}

// Interface (implícita em Dart)
abstract class Vehicle {
  void start();
  void stop();
}

// Implementação de interface
class Car implements Vehicle {
  @override
  void start() {
    print('Carro ligado');
  }

  @override
  void stop() {
    print('Carro desligado');
  }
}

// Mixins
mixin Logger {
  void log(String message) {
    print('LOG: $message');
  }
}

class LoggedCar extends Car with Logger {
  void drive() {
    log('Carro em movimento');
  }
}

void classesExample() {
  var person = Person('João', 30);
  person.introduce();

  var employee = Employee('Maria', 28, 'Google');
  employee.introduce();

  var car = LoggedCar();
  car.start();
  car.drive();
  car.stop();
}

// ===== NULL SAFETY =====

void nullSafetyExample() {
  // Variável não-nula
  String nonNullable = 'Não pode ser nulo';
  // nonNullable = null; // Erro de compilação

  // Variável que aceita nulo
  String? nullable = 'Pode ser nulo';
  nullable = null; // OK

  // Operador de acesso seguro
  print(nullable?.length); // null se nullable for null

  // Operador de coalescência nula
  String result = nullable ?? 'Valor padrão';

  // Assertion operator (!)
  String? possiblyNull = 'Não é nulo agora';
  String definitelyNotNull = possiblyNull; // Lança exceção se for null, possiblyNull!

  // Verificação de nulo
  if (nullable != null) {
    print('O comprimento é ${nullable.length}');
  }
}

// ===== ASYNC/AWAIT =====

Future<void> fetchData() async {
  print('Iniciando download...');

  // Simulando uma operação assíncrona
  await Future.delayed(Duration(seconds: 2));

  print('Download concluído!');
}

Future<String> getUserName() async {
  // Simulando uma chamada de API
  await Future.delayed(Duration(seconds: 1));
  return 'John Doe';
}

void asyncExample() async {
  print('Antes da chamada assíncrona');

  // Usando await
  await fetchData();

  // Usando then
  getUserName().then((name) {
    print('Nome do usuário: $name');
  });

  // Tratamento de erros
  try {
    await fetchData();
  } catch (e) {
    print('Erro: $e');
  }

  print('Depois da chamada assíncrona');
}

// ===== MAIN FUNCTION =====

void main() {
  print('\n=== VARIÁVEIS E TIPOS ===');
  variablesAndTypes();

  print('\n=== COLEÇÕES ===');
  collections();

  print('\n=== ESTRUTURAS DE CONTROLE ===');
  controlStructures();

  print('\n=== FUNÇÕES ===');
  functionsExample();
  print('Soma: ${sum(5, 3)}');
  print('Saudação: ${greet("Maria", "Dra.")}');
  printPersonInfo(name: 'Carlos', age: 35);

  print('\n=== CLASSES E OBJETOS ===');
  classesExample();

  print('\n=== NULL SAFETY ===');
  nullSafetyExample();

  print('\n=== ASYNC/AWAIT ===');
  asyncExample();
}
