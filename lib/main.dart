import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

/// Root widget of the Car Reminder Application.
/// 
/// Sets up the Material App with a purple color scheme and initializes
/// the HomeScreen as the starting point of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Reminder App',
      debugShowCheckedModeBanner: false,
      // Configure theme with purple seed color and Material 3 design
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

