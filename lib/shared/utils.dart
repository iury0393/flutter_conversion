import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

const kBaseURL = '';
var kLogger = Logger();

class Utils {
  EdgeInsets getPaddingDefault({double? left, double? top, double? right, double? bottom}) {
    return EdgeInsets.fromLTRB(left ?? 15.0, top ?? 10.0, right ?? 15.0, bottom ?? 10.0);
  }
}
