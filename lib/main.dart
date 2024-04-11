import 'package:flutter/material.dart';
import 'package:flutter_conversion/home/presentation/page/home.dart';

main() {
  runApp(const ConversionApp());
}

class ConversionApp extends StatelessWidget {
  const ConversionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Conversão de moedas para BRL',
      home: HomePage(),
    );
  }
}
