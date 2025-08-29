import 'package:flutter/material.dart';
import 'package:todo_pro/screens/auth_screen.dart';
import 'package:todo_pro/screens/home_screen.dart';
import 'package:todo_pro/screens/new_list_screen.dart';
import 'package:todo_pro/screens/not_found_screen.dart';
import 'package:todo_pro/screens/onboarding_screen.dart';
import 'package:todo_pro/screens/project_screen.dart';
import 'package:todo_pro/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo Pro',
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/auth': (context) => const AuthScreen(),
        '/home': (context) => const HomeScreen(),
        '/new-list': (context) => const NewListScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/project') {
          final args = settings.arguments as String; // ✅ get projectTitle
          return MaterialPageRoute(
            builder: (context) => ProjectScreen(projectTitle: args),
          );
        }
        return null;
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const NotFoundScreen());
      },
    );
  }
}
