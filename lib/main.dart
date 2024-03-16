import 'package:flutter/material.dart';
import 'package:homework_6/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFF1EFE7)),
        useMaterial3: true,
        scaffoldBackgroundColor: Color(0xFFF1EFE7),
      ),
      home: const HomePage(),
    );
  }
}
