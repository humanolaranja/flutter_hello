import 'package:flutter/material.dart';
import 'package:flutter_hello/examples/notifier_examples.dart';
import 'package:provider/provider.dart';

class NotifierExamplesPage extends StatelessWidget {
  const NotifierExamplesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Management Examples'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            title: 'ChangeNotifier',
            description: 'Used for complex state management with multiple properties',
            examples: [
              _buildExampleCard(
                title: 'Counter Example',
                description: 'A simple counter using ChangeNotifier',
                onTap: () => _showChangeNotifierCounter(context),
              ),
              _buildExampleCard(
                title: 'Theme Switcher',
                description: 'Toggle between light and dark theme',
                onTap: () => _showThemeSwitcher(context),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSection(
            title: 'ValueNotifier',
            description: 'Used for simple state management with a single value',
            examples: [
              _buildExampleCard(
                title: 'Counter Example',
                description: 'A simple counter using ValueNotifier',
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => CounterValueNotifierExample()),
                ),
              ),
              _buildExampleCard(
                title: 'Form Field Example',
                description: 'Form validation using ValueNotifier',
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => FormFieldValueNotifierExample()),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSection(
            title: 'Combined Example',
            description: 'Using both ChangeNotifier and ValueNotifier together',
            examples: [
              _buildExampleCard(
                title: 'Combined Notifiers',
                description: 'Theme with ChangeNotifier and text size with ValueNotifier',
                onTap: () => _showCombinedExample(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String description,
    required List<Widget> examples,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
        ),
        const SizedBox(height: 16),
        ...examples,
      ],
    );
  }

  Widget _buildExampleCard({
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }

  void _showChangeNotifierCounter(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider(
          create: (_) => CounterChangeNotifier(),
          child: _ChangeNotifierCounterExample(),
        ),
      ),
    );
  }

  void _showThemeSwitcher(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider(
          create: (_) => ThemeChangeNotifier(),
          child: _ThemeSwitcherExample(),
        ),
      ),
    );
  }

  void _showCombinedExample(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider(
          create: (_) => ThemeChangeNotifier(),
          child: Builder(
            builder: (context) {
              // Access the theme notifier to apply theme
              final themeNotifier = context.watch<ThemeChangeNotifier>();
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                themeMode: themeNotifier.themeMode,
                theme: ThemeData.light(),
                darkTheme: ThemeData.dark(),
                home: const CombinedNotifierExample(),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ChangeNotifierCounterExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangeNotifier Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            // Use Consumer to listen to changes
            Consumer<CounterChangeNotifier>(
              builder: (context, counter, child) {
                return Text(
                  '${counter.count}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => context.read<CounterChangeNotifier>().decrement(),
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => context.read<CounterChangeNotifier>().reset(),
                  child: const Icon(Icons.refresh),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => context.read<CounterChangeNotifier>().increment(),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeSwitcherExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeChangeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeNotifier.themeMode,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Theme Switcher Example'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    themeNotifier.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                    size: 100,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    themeNotifier.isDarkMode ? 'Dark Mode' : 'Light Mode',
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.swap_horiz),
                    label: const Text('Toggle Theme'),
                    onPressed: () => themeNotifier.toggleTheme(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
