import 'package:flutter/material.dart';
import 'package:flutter_conversion/dependency_injection.dart';
import 'package:flutter_conversion/home/presentation/page/home.dart';

main() {
  setup();
  runApp(const ConversionApp());
}

class ConversionApp extends StatelessWidget {
  const ConversionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Conversão de moedas para BRL',
      home: const HomePage(),
    );
  }
}
