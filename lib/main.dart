import 'theme/app_theme.dart';
import 'theme/theme_state.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(themeState: ThemeState()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.themeState});
  final ThemeState themeState;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeState,
      builder: (context, _) {
        return MaterialApp(
          title: 'Hummy',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeState.themeMode,
          home: Scaffold(
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
