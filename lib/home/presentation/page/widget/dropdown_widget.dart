import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conversion/shared/conversion.dart';
import 'package:flutter_conversion/shared/conversion_styles.dart';
import 'package:flutter_conversion/shared/utils.dart';

class DropdownWidget extends StatefulWidget {
  final List<Conversion> items;
  final String title;
  final String? selectedValued;
  const DropdownWidget({
    super.key,
    required this.items,
    required this.title,
    this.selectedValued,
  });

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  final ConversionStyles conversionStyles = ConversionStyles();
  final TextSize textSize = TextSize();
  final Utils utils = Utils();

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
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
                    widget.title,
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
            items: widget.items
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
            value: widget.selectedValued,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
                kLogger.d(value);
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
