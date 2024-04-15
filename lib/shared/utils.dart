import 'package:flutter/material.dart';
import 'package:flutter_conversion/shared/conversion.dart';
import 'package:logger/logger.dart';

const kBaseURL = 'https://economia.awesomeapi.com.br';
var kLogger = Logger();

class Utils {
  EdgeInsets getPaddingDefault({double? left, double? top, double? right, double? bottom}) {
    return EdgeInsets.fromLTRB(left ?? 15.0, top ?? 10.0, right ?? 15.0, bottom ?? 10.0);
  }

  final List<Conversion> items = [
    Conversion.dolarAmericano,
    Conversion.euro,
    Conversion.libraEsterlina,
    Conversion.iene,
    Conversion.dolarAustraliano,
    Conversion.francoSuico,
    Conversion.dolarCanadense,
    Conversion.yuan,
    Conversion.pesoArgentino,
    Conversion.real,
    Conversion.liraTurca,
  ];

  final List<Conversion> items2 = [
    Conversion.real,
  ];
}
