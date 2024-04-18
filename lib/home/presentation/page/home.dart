import 'package:brasil_fields/brasil_fields.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_conversion/home/presentation/controller/home_controller.dart';
import 'package:flutter_conversion/shared/conversion.dart';
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
  final HomeController _controller = HomeController();
  String? selectedValue;

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
                  child: dropDownWidget(items: utils.items, title: 'Moeda'),
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
                  child: dropDownWidget(
                    items: utils.items2,
                    title: 'Real',
                    selectedValueFromRoot: 'BRL',
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
            ElevatedButton(
              onPressed: () {
                // _controller.getConversion();
                kLogger.d(_controller.selectedValueFromDropdown);
              },
              child: Text(
                'clica aqui',
                style: ConversionStyles().paragraph(TextSize().large),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textFormFieldWidget({
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

  Widget dropDownWidget({
    required List<Conversion> items,
    required String title,
    String? selectedValueFromRoot,
  }) {
    return Scaffold(
      body: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Row(
              children: [
                const Icon(
                  Icons.monetization_on,
                  size: 16,
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    title,
                    style: conversionStyles.paragraph(
                      textSize.xMedium,
                      color: Colors.white,
                      weight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: items
                .map((Conversion item) => DropdownMenuItem<String>(
                      value: item.code,
                      child: Text(
                        item.name,
                        style: conversionStyles.paragraph(
                          textSize.xMedium,
                          color: Colors.white,
                          weight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            value: selectedValueFromRoot ?? selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
                _controller.setDropDownValue(value!);
              });
            },
            buttonStyleData: ButtonStyleData(
              height: 50,
              width: 160,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.black26,
                ),
                color: Colors.white38,
              ),
              elevation: 2,
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
              ),
              iconSize: 14,
              iconEnabledColor: Colors.yellow,
              iconDisabledColor: Colors.grey,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white38,
              ),
              offset: const Offset(-20, 0),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all(6),
                thumbVisibility: MaterialStateProperty.all(true),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.only(left: 14, right: 14),
            ),
          ),
        ),
      ),
    );
  }
}
