import 'package:flutter/material.dart';
import 'package:shopping_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      title: 'Shopping App ',
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(254, 206, 1, 1),
          primary: const Color.fromRGBO(254, 206, 1, 1),
        ),
        useMaterial3: true,
      ),
    );
  }
}
