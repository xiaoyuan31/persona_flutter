import 'package:flutter/material.dart';
import 'package:persona_flutter/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persona Compendium',
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.redAccent,
          scaffoldBackgroundColor: const Color(0xFF121212),
        ),
      home: const HomeScreen()
    );
  }
}

