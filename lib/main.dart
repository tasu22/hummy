import 'screens/home_page.dart';
import 'theme/app_theme.dart';
import 'theme/theme_state.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
          // We pass themeState to HomePage so it can toggle theme and access Navigator correctly
          home: HomePage(themeState: themeState),
        );
      },
    );
  }
}
