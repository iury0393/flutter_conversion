import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_conversion/shared/conversion_styles.dart';
import 'package:flutter_conversion/shared/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ConversionStyles conversionStyles = ConversionStyles();
  final Utils utils = Utils();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Conversão',
          style: conversionStyles.appBarTitle(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: utils.getPaddingDefault(),
            child: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  width: width / 3.5,
                  height: 50,
                ),
                const SizedBox(
                  width: 4,
                ),
                Container(
                  width: width / 1.6,
                  height: 50,
                  child: TextField(
                    decoration: const InputDecoration(labelText: "Enter your number"),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
