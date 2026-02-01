import 'package:flutter/material.dart';
import '../theme/theme_state.dart';
import 'player_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.themeState});

  final ThemeState themeState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hummy')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Hello World'),
            const SizedBox(height: 20),
            // Temporary button to test theme toggling
            ElevatedButton(
              onPressed: () {
                themeState.toggleTheme();
              },
              child: Text(
                themeState.themeMode == ThemeMode.light
                    ? 'Switch to Dark'
                    : 'Switch to Light',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // This context is now BELOW the MaterialApp (Navigator), so it works!
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const PlayerPage()),
                );
              },
              icon: const Icon(Icons.play_circle_outline),
              label: const Text('Open Player'),
            ),
          ],
        ),
      ),
    );
  }
}
