// KOTLIN EXAMPLES FOR COMPARISON WITH DART
// Este arquivo contém exemplos de código Kotlin equivalentes aos exemplos em Dart

// ===== VARIÁVEIS E TIPOS =====

fun variablesAndTypes() {
    // Declaração com tipo explícito
    val name: String = "Flutter"
    val age: Int = 5
    val height: Double = 1.75
    val isAwesome: Boolean = true
    
    // Inferência de tipo
    val language = "Kotlin" // String
    val version = 1.8       // Double
    val isStronglyTyped = true // Boolean
    
    // Constantes (val em Kotlin é equivalente a final em Dart)
    val currentYear = 2023 // não pode ser reatribuído
    const val PI = 3.14159 // constante de compilação
    
    // Null safety
    val nullableName: String? = null // pode ser nulo
    val nonNullableName: String = "Required" // não pode ser nulo
    
    // Late initialization
    lateinit var lateInitialized: String
    // ... algum código ...
    lateInitialized = "Inicializado depois"
    
    println("Variáveis em Kotlin: $name, $age, $height, $isAwesome")
    println("Inferência: $language, $version, $isStronglyTyped")
}

// ===== COLEÇÕES =====

fun collections() {
    // Listas
    val fruits: List<String> = mutableListOf("Apple", "Banana", "Orange")
    val numbers = mutableListOf(1, 2, 3, 4, 5)
    
    // Lista imutável
    val constList = listOf(1, 2, 3)
    
    // Operações com listas
    (fruits as MutableList<String>).add("Mango")
    (fruits as MutableList<String>).remove("Apple")
    fruits.forEach { fruit -> println(fruit) }
    
    // Map (dicionário)
    val ages = mutableMapOf(
        "Alice" to 30,
        "Bob" to 25,
        "Charlie" to 35
    )
    
    // Operações com maps
    ages["David"] = 40
    println("Bob tem ${ages["Bob"]} anos")
    
    // Set
    val uniqueNumbers = mutableSetOf(1, 2, 3, 3, 4) // {1, 2, 3, 4}
    uniqueNumbers.add(5)
    println("Contém 3? ${uniqueNumbers.contains(3)}")
}

// ===== ESTRUTURAS DE CONTROLE =====

fun controlStructures() {
    // If-else
    val x = 10
    if (x > 5) {
        println("x é maior que 5")
    } else if (x == 5) {
        println("x é igual a 5")
    } else {
        println("x é menor que 5")
    }
    
    // If como expressão (equivalente ao operador ternário)
    val result = if (x > 5) "maior que 5" else "menor ou igual a 5"
    
    // When (equivalente ao switch)
    val fruit = "Apple"
    when (fruit) {
        "Apple" -> println("É uma maçã")
        "Banana" -> println("É uma banana")
        else -> println("É outra fruta")
    }
    
    // For loop
    for (i in 0 until 5) {
        println("Índice: $i")
    }
    
    // For-in loop (para coleções)
    val names = listOf("Alice", "Bob", "Charlie")
    for (name in names) {
        println("Nome: $name")
    }
    
    // While loop
    var count = 0
    while (count < 3) {
        println("Contagem: $count")
        count++
    }
    
    // Do-while loop
    var y = 0
    do {
        println("y é $y")
        y++
    } while (y < 3)
}

// ===== FUNÇÕES =====

// Função com tipo de retorno e parâmetros tipados
fun sum(a: Int, b: Int): Int {
    return a + b
}

// Função com parâmetros opcionais
fun greet(name: String, title: String? = null): String {
    return if (title != null) "Hello $title $name" else "Hello $name"
}

// Função com parâmetros nomeados
fun printPersonInfo(name: String, age: Int? = null, country: String = "Brasil") {
    println("Nome: $name, Idade: ${age ?: "N/A"}, País: $country")
}

// Função de uma linha
fun multiply(a: Int, b: Int): Int = a * b

// Função anônima (lambda)
fun functionsExample() {
    val numbers = listOf(1, 2, 3, 4, 5)
    
    // Usando função anônima
    numbers.forEach { number ->
        println(number * 2)
    }
    
    // Versão mais curta
    numbers.forEach { println(it * 3) }
    
    // Função como parâmetro
    val operation: (Int, Int) -> Int = ::sum
    println("Resultado: ${operation(5, 3)}")
}

// ===== CLASSES E OBJETOS =====

// Classe básica
class Person(
    // Propriedades
    var name: String,
    var age: Int
) {
    // Construtor secundário
    constructor() : this("Guest", 0)
    
    // Método
    fun introduce() {
        println("Olá, meu nome é $name e tenho $age anos.")
    }
    
    // Getter
    val description: String
        get() = "$name, $age anos"
    
    // Setter personalizado
    var setAge: Int
        get() = age
        set(value) {
            if (value >= 0) {
                age = value
            }
        }
}

// Herança
class Employee(name: String, age: Int, val company: String) : Person(name, age) {
    override fun introduce() {
        super.introduce()
        println("Eu trabalho na $company.")
    }
}

// Interface
interface Vehicle {
    fun start()
    fun stop()
}

// Implementação de interface
class Car : Vehicle {
    override fun start() {
        println("Carro ligado")
    }
    
    override fun stop() {
        println("Carro desligado")
    }
}

// Mixins (usando interfaces com implementações padrão)
interface Logger {
    fun log(message: String) {
        println("LOG: $message")
    }
}

class LoggedCar : Car(), Logger {
    fun drive() {
        log("Carro em movimento")
    }
}

fun classesExample() {
    val person = Person("João", 30)
    person.introduce()
    
    val employee = Employee("Maria", 28, "Google")
    employee.introduce()
    
    val car = LoggedCar()
    car.start()
    car.drive()
    car.stop()
}

// ===== NULL SAFETY =====

fun nullSafetyExample() {
    // Variável não-nula
    var nonNullable: String = "Não pode ser nulo"
    // nonNullable = null // Erro de compilação
    
    // Variável que aceita nulo
    var nullable: String? = "Pode ser nulo"
    nullable = null // OK
    
    // Operador de acesso seguro
    println(nullable?.length) // null se nullable for null
    
    // Operador Elvis (equivalente ao operador de coalescência nula)
    val result = nullable ?: "Valor padrão"
    
    // Operador de assertion não-nulo (!!)
    val possiblyNull: String? = "Não é nulo agora"
    val definitelyNotNull: String = possiblyNull!! // Lança exceção se for null
    
    // Verificação de nulo
    if (nullable != null) {
        println("O comprimento é ${nullable.length}")
    }
}

// ===== COROUTINES (ASYNC/AWAIT) =====

import kotlinx.coroutines.*

suspend fun fetchData() {
    println("Iniciando download...")
    
    // Simulando uma operação assíncrona
    delay(2000) // equivalente a await Future.delayed
    
    println("Download concluído!")
}

suspend fun getUserName(): String {
    // Simulando uma chamada de API
    delay(1000)
    return "John Doe"
}

fun asyncExample() = runBlocking {
    println("Antes da chamada assíncrona")
    
    // Usando await (suspend)
    fetchData()
    
    // Lançando coroutine
    launch {
        val name = getUserName()
        println("Nome do usuário: $name")
    }
    
    // Tratamento de erros
    try {
        fetchData()
    } catch (e: Exception) {
        println("Erro: $e")
    }
    
    println("Depois da chamada assíncrona")
}

// ===== MAIN FUNCTION =====

fun main() {
    println("\n=== VARIÁVEIS E TIPOS ===")
    variablesAndTypes()
    
    println("\n=== COLEÇÕES ===")
    collections()
    
    println("\n=== ESTRUTURAS DE CONTROLE ===")
    controlStructures()
    
    println("\n=== FUNÇÕES ===")
    functionsExample()
    println("Soma: ${sum(5, 3)}")
    println("Saudação: ${greet("Maria", "Dra.")}")
    printPersonInfo(name = "Carlos", age = 35)
    
    println("\n=== CLASSES E OBJETOS ===")
    classesExample()
    
    println("\n=== NULL SAFETY ===")
    nullSafetyExample()
    
    println("\n=== ASYNC/AWAIT (COROUTINES) ===")
    asyncExample()
}