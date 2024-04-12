import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_conversion/home/presentation/widget/dropdown_widget.dart';
import 'package:flutter_conversion/shared/conversion_styles.dart';
import 'package:flutter_conversion/shared/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ConversionStyles conversionStyles = ConversionStyles();
  final TextSize textSize = TextSize();
  final Utils utils = Utils();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Conversão',
          style: conversionStyles.appBarTitle(
            textColor: Colors.white,
            size: textSize.big,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width / 2.8,
                  height: 50,
                  child: DropdownWidget(items: utils.items, title: 'Moeda'),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: width / 1.7,
                  child: textFormFieldWidget(
                    onChanged: (value) {
                      kLogger.d(value);
                    },
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Icon(
                Icons.swap_vert,
                size: 50,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width / 2.8,
                  height: 50,
                  child: DropdownWidget(
                    items: utils.items2,
                    title: 'Real',
                    selectedValued: 'BRL',
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: width / 1.7,
                  child: textFormFieldWidget(
                    readOnly: true,
                    onChanged: (value) {
                      kLogger.d(value);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextFormField textFormFieldWidget({
    String initialValue = '1',
    bool readOnly = false,
    Function(String)? onChanged,
  }) {
    return TextFormField(
      readOnly: readOnly,
      initialValue: initialValue,
      textAlign: TextAlign.end,
      style: conversionStyles.paragraph(
        textSize.xMedium,
        color: Colors.white,
        weight: FontWeight.bold,
      ),
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.white38,
        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CentavosInputFormatter(),
      ],
      onChanged: onChanged,
    );
  }
}
