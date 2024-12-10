import 'package:flutter/material.dart';
import 'package:love_calculator/screens/calculator_screen.dart';

class LoveCalculatorApp extends StatelessWidget {
  const LoveCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}