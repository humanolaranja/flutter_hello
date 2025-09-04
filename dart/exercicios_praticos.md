# Exercícios Práticos: De Kotlin para Dart

## Exercício 1: Variáveis e Tipos

**Kotlin:**
```kotlin
fun exercicio1() {
    val nome: String = "Flutter"
    val idade = 5
    val altura = 1.75
    val linguagens = listOf("Dart", "Kotlin", "Swift")
    
    println("$nome tem $idade anos e ${linguagens.size} linguagens")
}
```

**Desafio:** Converta o código acima para Dart, usando os tipos e sintaxe apropriados.

**Solução:**
```dart
void exercicio1() {
  final String nome = 'Flutter';
  final idade = 5;
  final altura = 1.75;
  final linguagens = ['Dart', 'Kotlin', 'Swift'];
  
  print('$nome tem $idade anos e ${linguagens.length} linguagens');
}
```

## Exercício 2: Funções e Parâmetros

**Kotlin:**
```kotlin
fun calcularPreco(
    produto: String,
    quantidade: Int,
    precoUnitario: Double = 10.0,
    desconto: Double? = null
): Double {
    var total = quantidade * precoUnitario
    if (desconto != null) {
        total -= desconto
    }
    return total
}

fun testarCalculoPreco() {
    val preco1 = calcularPreco("Camiseta", 2)
    val preco2 = calcularPreco("Calça", 1, 50.0)
    val preco3 = calcularPreco(
        produto = "Tênis",
        quantidade = 1,
        precoUnitario = 100.0,
        desconto = 20.0
    )
    
    println("Preços: $preco1, $preco2, $preco3")
}
```

**Desafio:** Converta o código acima para Dart, usando a sintaxe apropriada para parâmetros opcionais e nomeados.

**Solução:**
```dart
double calcularPreco(
    String produto,
    int quantidade,
    {double precoUnitario = 10.0,
    double? desconto}
) {
  var total = quantidade * precoUnitario;
  if (desconto != null) {
    total -= desconto;
  }
  return total;
}

void testarCalculoPreco() {
  final preco1 = calcularPreco('Camiseta', 2);
  final preco2 = calcularPreco('Calça', 1, precoUnitario: 50.0);
  final preco3 = calcularPreco(
    'Tênis',
    1,
    precoUnitario: 100.0,
    desconto: 20.0
  );
  
  print('Preços: $preco1, $preco2, $preco3');
}
```

## Exercício 3: Classes e Herança

**Kotlin:**
```kotlin
open class Produto(
    val nome: String,
    val preco: Double
) {
    open fun descricao(): String {
        return "$nome - R$ $preco"
    }
}

class ProdutoPerecivel(
    nome: String,
    preco: Double,
    val dataValidade: String
) : Produto(nome, preco) {
    override fun descricao(): String {
        return "${super.descricao()} - Validade: $dataValidade"
    }
}

fun testarProdutos() {
    val produto = Produto("Caderno", 15.90)
    val perecivel = ProdutoPerecivel("Leite", 4.50, "10/12/2023")
    
    println(produto.descricao())
    println(perecivel.descricao())
}
```

**Desafio:** Converta o código acima para Dart, usando a sintaxe apropriada para classes e herança.

**Solução:**
```dart
class Produto {
  final String nome;
  final double preco;
  
  Produto(this.nome, this.preco);
  
  String descricao() {
    return '$nome - R\$ $preco';
  }
}

class ProdutoPerecivel extends Produto {
  final String dataValidade;
  
  ProdutoPerecivel(String nome, double preco, this.dataValidade)
      : super(nome, preco);
  
  @override
  String descricao() {
    return '${super.descricao()} - Validade: $dataValidade';
  }
}

void testarProdutos() {
  final produto = Produto('Caderno', 15.90);
  final perecivel = ProdutoPerecivel('Leite', 4.50, '10/12/2023');
  
  print(produto.descricao());
  print(perecivel.descricao());
}
```

## Exercício 4: Coleções e Operações Funcionais

**Kotlin:**
```kotlin
fun manipularLista() {
    val numeros = listOf(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
    
    // Filtrar números pares
    val pares = numeros.filter { it % 2 == 0 }
    
    // Dobrar cada número
    val dobrados = numeros.map { it * 2 }
    
    // Somar todos os números
    val soma = numeros.sum()
    
    // Agrupar por pares e ímpares
    val agrupados = numeros.groupBy { if (it % 2 == 0) "par" else "ímpar" }
    
    println("Pares: $pares")
    println("Dobrados: $dobrados")
    println("Soma: $soma")
    println("Agrupados: $agrupados")
}
```

**Desafio:** Converta o código acima para Dart, usando a sintaxe apropriada para operações em coleções.

**Solução:**
```dart
void manipularLista() {
  final numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  
  // Filtrar números pares
  final pares = numeros.where((n) => n % 2 == 0).toList();
  
  // Dobrar cada número
  final dobrados = numeros.map((n) => n * 2).toList();
  
  // Somar todos os números
  final soma = numeros.reduce((a, b) => a + b);
  
  // Agrupar por pares e ímpares
  final agrupados = {
    'par': numeros.where((n) => n % 2 == 0).toList(),
    'ímpar': numeros.where((n) => n % 2 != 0).toList(),
  };
  
  print('Pares: $pares');
  print('Dobrados: $dobrados');
  print('Soma: $soma');
  print('Agrupados: $agrupados');
}
```

## Exercício 5: Programação Assíncrona

**Kotlin:**
```kotlin
import kotlinx.coroutines.*

suspend fun buscarDados(): String {
    delay(2000) // Simula uma operação de rede
    return "Dados obtidos"
}

suspend fun processarDados(dados: String): String {
    delay(1000) // Simula processamento
    return "Processado: $dados"
}

fun testarAsync() = runBlocking {
    println("Iniciando operações assíncronas")
    
    val dados = buscarDados()
    println("Dados recebidos: $dados")
    
    val resultado = processarDados(dados)
    println("Resultado final: $resultado")
    
    println("Operações concluídas")
}
```

**Desafio:** Converta o código acima para Dart, usando a sintaxe apropriada para operações assíncronas com `async`/`await`.

**Solução:**
```dart
Future<String> buscarDados() async {
  await Future.delayed(Duration(seconds: 2)); // Simula uma operação de rede
  return 'Dados obtidos';
}

Future<String> processarDados(String dados) async {
  await Future.delayed(Duration(seconds: 1)); // Simula processamento
  return 'Processado: $dados';
}

Future<void> testarAsync() async {
  print('Iniciando operações assíncronas');
  
  final dados = await buscarDados();
  print('Dados recebidos: $dados');
  
  final resultado = await processarDados(dados);
  print('Resultado final: $resultado');
  
  print('Operações concluídas');
}
```

## Exercício 6: Null Safety

**Kotlin:**
```kotlin
fun manipularNulos() {
    val texto: String? = obterTextoOpcional()
    
    // Comprimento seguro
    val comprimento = texto?.length ?: 0
    
    // Operação condicional
    if (texto != null) {
        println("Texto em maiúsculas: ${texto.toUpperCase()}")
    }
    
    // Operador Elvis
    val textoNaoNulo = texto ?: "Texto padrão"
    
    // Assertion não-nulo (cuidado!)
    try {
        val forcarNaoNulo = texto!!.length
        println("Comprimento: $forcarNaoNulo")
    } catch (e: Exception) {
        println("Erro: texto é nulo")
    }
}

fun obterTextoOpcional(): String? {
    // Retorna nulo aleatoriamente para teste
    return if (Math.random() > 0.5) "Algum texto" else null
}
```

**Desafio:** Converta o código acima para Dart, usando a sintaxe apropriada para null safety.

**Solução:**
```dart
import 'dart:math';

void manipularNulos() {
  final String? texto = obterTextoOpcional();
  
  // Comprimento seguro
  final comprimento = texto?.length ?? 0;
  
  // Operação condicional
  if (texto != null) {
    print('Texto em maiúsculas: ${texto.toUpperCase()}');
  }
  
  // Operador de coalescência nula
  final textoNaoNulo = texto ?? 'Texto padrão';
  
  // Assertion não-nulo (cuidado!)
  try {
    final forcarNaoNulo = texto!.length;
    print('Comprimento: $forcarNaoNulo');
  } catch (e) {
    print('Erro: texto é nulo');
  }
}

String? obterTextoOpcional() {
  // Retorna nulo aleatoriamente para teste
  return Random().nextDouble() > 0.5 ? 'Algum texto' : null;
}
```

## Exercício 7: Interfaces e Implementações

**Kotlin:**
```kotlin
interface Autenticavel {
    fun autenticar(senha: String): Boolean
}

class Usuario(
    val nome: String,
    private val senhaCorreta: String
) : Autenticavel {
    override fun autenticar(senha: String): Boolean {
        return senha == senhaCorreta
    }
}

class Sistema {
    fun login(autenticavel: Autenticavel, senha: String): Boolean {
        return autenticavel.autenticar(senha)
    }
}

fun testarAutenticacao() {
    val usuario = Usuario("admin", "123456")
    val sistema = Sistema()
    
    val loginSucesso = sistema.login(usuario, "123456")
    val loginFalha = sistema.login(usuario, "senha_errada")
    
    println("Login com senha correta: $loginSucesso")
    println("Login com senha errada: $loginFalha")
}
```

**Desafio:** Converta o código acima para Dart, usando a sintaxe apropriada para interfaces e implementações.

**Solução:**
```dart
abstract class Autenticavel {
  bool autenticar(String senha);
}

class Usuario implements Autenticavel {
  final String nome;
  final String _senhaCorreta;
  
  Usuario(this.nome, this._senhaCorreta);
  
  @override
  bool autenticar(String senha) {
    return senha == _senhaCorreta;
  }
}

class Sistema {
  bool login(Autenticavel autenticavel, String senha) {
    return autenticavel.autenticar(senha);
  }
}

void testarAutenticacao() {
  final usuario = Usuario('admin', '123456');
  final sistema = Sistema();
  
  final loginSucesso = sistema.login(usuario, '123456');
  final loginFalha = sistema.login(usuario, 'senha_errada');
  
  print('Login com senha correta: $loginSucesso');
  print('Login com senha errada: $loginFalha');
}
```

## Exercício 8: Mixins

**Kotlin:**
```kotlin
interface Logger {
    fun log(message: String) {
        println("LOG: $message")
    }
}

interface Formatter {
    fun format(text: String): String {
        return "*** $text ***"
    }
}

class Processador : Logger, Formatter {
    fun processar(texto: String) {
        log("Iniciando processamento")
        val formatado = format(texto)
        log("Texto formatado: $formatado")
        log("Processamento concluído")
    }
}

fun testarMixins() {
    val processador = Processador()
    processador.processar("Exemplo de texto")
}
```

**Desafio:** Converta o código acima para Dart, usando a sintaxe apropriada para mixins.

**Solução:**
```dart
mixin Logger {
  void log(String message) {
    print('LOG: $message');
  }
}

mixin Formatter {
  String format(String text) {
    return '*** $text ***';
  }
}

class Processador with Logger, Formatter {
  void processar(String texto) {
    log('Iniciando processamento');
    final formatado = format(texto);
    log('Texto formatado: $formatado');
    log('Processamento concluído');
  }
}

void testarMixins() {
  final processador = Processador();
  processador.processar('Exemplo de texto');
}
```