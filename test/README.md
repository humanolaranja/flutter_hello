# Testing the Pokemon App

This directory contains tests for the Pokemon application. The tests are organized into the following categories:

- **Unit Tests**: Test individual classes and functions
- **Widget Tests**: Test UI components in isolation
- **Integration Tests**: Test multiple components working together

## Test Structure

### Unit Tests

- `test/entities/`: Tests for data models
  - `pokemon_test.dart`: Tests for the Pokemon class
  - `pokemon_details_test.dart`: Tests for the PokemonDetails class
  - `pokemon_details_sprites_test.dart`: Tests for the PokemonDetailsSprite class

- `test/providers/`: Tests for state management providers
  - `pokemon_provider_test.dart`: Tests for the PokemonProvider class
  - `favorite_pokemon_notifier_test.dart`: Tests for the FavoritePokemonNotifier class

- `test/service/`: Tests for API service functions
  - `pokemons_test.dart`: Tests for the fetchPokemons and fetchPokemon functions

### Widget Tests

- `test/widgets/`: Tests for individual UI components
  - `pokemon_list_item_test.dart`: Tests for the PokemonListItem widget
  - `pokemon_page_test.dart`: Tests for the PokemonPage widget

### Integration Tests

- `test/integration/`: Tests for multiple components working together
  - `pokemons_page_test.dart`: Tests for the PokemonsPage screen

## Running the Tests

To run all tests:

```bash
flutter test
```

To run a specific test file:

```bash
flutter test test/entities/pokemon_test.dart
```

To run tests in a specific directory:

```bash
flutter test test/entities/
```

## Testing Approach

### Mocking

We use custom mock implementations for:

- API services: To avoid making real network calls during tests
- Providers: To control the state during tests
- UI components: To isolate components for testing

### Testing State Management

We test both types of state management used in the app:

- **ChangeNotifier**: Used by PokemonProvider for complex state
- **ValueNotifier**: Used by FavoritePokemonNotifier for simpler state

### Testing UI

For UI tests, we:

1. Create a widget tree with the necessary providers
2. Verify the initial state
3. Interact with the widget (e.g., tap buttons)
4. Verify the updated state

### Handling Network Images

To handle network images in tests, we:

1. Use a custom TestPokemonPage that replaces Image.network with a Container
2. This avoids network requests during tests, which would fail in the test environment

## Test Coverage

The tests cover:

- Data parsing from JSON
- API service calls
- State management (loading, error states, data states)
- UI rendering
- User interactions (like toggling favorites)
- Error handling