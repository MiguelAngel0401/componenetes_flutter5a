import 'package:flutter/material.dart';
import 'home_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 168, 250, 165),
        appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 255, 90, 78)),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontFamily: 'sans-serif',
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 10, 4, 4),
          ),
          bodySmall: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 57, 22, 255),
          ),
        ),
      ),
    );
  }
}
