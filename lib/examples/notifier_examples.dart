import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// This file contains simple examples of ChangeNotifier and ValueNotifier
/// for educational purposes

// Example 1: Simple Counter with ChangeNotifier
class CounterChangeNotifier extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}

// Example 2: Theme Switcher with ChangeNotifier
class ThemeChangeNotifier extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;
  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

// Example 3: Simple Counter with ValueNotifier
class CounterValueNotifierExample extends StatelessWidget {
  CounterValueNotifierExample({Key? key}) : super(key: key);

  // Create a ValueNotifier with an initial value of 0
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueNotifier Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            // Use ValueListenableBuilder to rebuild only when the value changes
            ValueListenableBuilder<int>(
              valueListenable: _counter,
              builder: (context, value, child) {
                return Text(
                  '$value',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Update the value directly
        onPressed: () => _counter.value++,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Example 4: Form Field with ValueNotifier
class FormFieldValueNotifierExample extends StatelessWidget {
  FormFieldValueNotifierExample({Key? key}) : super(key: key);

  final ValueNotifier<String> _name = ValueNotifier<String>('');
  final ValueNotifier<bool> _isValid = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form ValueNotifier Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your name',
              ),
              onChanged: (value) {
                _name.value = value;
                _isValid.value = value.length >= 3;
              },
            ),
            const SizedBox(height: 20),
            ValueListenableBuilder<String>(
              valueListenable: _name,
              builder: (context, value, child) {
                if (value.isEmpty) return const SizedBox.shrink();
                return Text('Hello, $value!');
              },
            ),
            const SizedBox(height: 20),
            ValueListenableBuilder<bool>(
              valueListenable: _isValid,
              builder: (context, isValid, child) {
                return ElevatedButton(
                  onPressed: isValid ? () {} : null,
                  child: const Text('Submit'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Example 5: Combined ChangeNotifier and ValueNotifier
class CombinedNotifierExample extends StatelessWidget {
  const CombinedNotifierExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access the ChangeNotifier through Provider
    final themeNotifier = context.watch<ThemeChangeNotifier>();

    // Create a local ValueNotifier
    final textSize = ValueNotifier<double>(16.0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Combined Notifiers Example'),
        actions: [
          IconButton(
            icon: Icon(themeNotifier.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => themeNotifier.toggleTheme(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder<double>(
              valueListenable: textSize,
              builder: (context, size, child) {
                return Text(
                  'This text size changes',
                  style: TextStyle(fontSize: size),
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (textSize.value > 8) {
                      textSize.value -= 2;
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    textSize.value += 2;
                  },
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              'Theme is controlled by ChangeNotifier',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'Text size is controlled by ValueNotifier',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
