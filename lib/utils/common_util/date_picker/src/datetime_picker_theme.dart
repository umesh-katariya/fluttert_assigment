import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Migrate DiagnosticableMixin to Diagnosticable until
// https://github.com/flutter/flutter/pull/51495 makes it into stable (v1.15.21)
class DatePickerTheme with DiagnosticableTreeMixin {
  final TextStyle cancelStyle;
  final TextStyle doneStyle;
  final TextStyle itemStyle;
  final Color backgroundColor;
  final Color? titleColor;
  final Color? headerColor;

  final TextStyle headerStyle;
  final String headerText;

  final double containerHeight;
  final double headerHeight;
  final double titleHeight;
  final double itemHeight;

  final bool showDate;
  final bool showMonth;

  const DatePickerTheme({
    this.cancelStyle = const TextStyle(color: Colors.black54, fontSize: 16),
    this.doneStyle = const TextStyle(color: Colors.blue, fontSize: 16),
    this.itemStyle = const TextStyle(color: Color(0xFF000046), fontSize: 18),
    this.backgroundColor = Colors.white,
    this.titleColor,
    this.headerColor,
    this.showDate=true,
    this.showMonth=true,
    this.headerStyle = const TextStyle(color: Color(0xFF000046),fontWeight: FontWeight.w600, fontSize: 18),
    this.headerText = "Select",
    this.containerHeight = 210.0,
    this.titleHeight = 44.0,
    this.itemHeight = 36.0,
    this.headerHeight = 36.0,
  });
}
