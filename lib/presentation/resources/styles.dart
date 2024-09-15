import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'font.dart';




class FontConstants {
  FontConstants._();

  static const String? fontFamily = null;
}
TextStyle _getTextStyle(
    double fontSize,
    FontWeight fontWeight,
    Color color, {
      bool italic = false,
      bool lineThrough = false,
    }) {
  return GoogleFonts.acme().copyWith(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      color: color,
      fontWeight: fontWeight,
      decorationStyle: TextDecorationStyle.double,
      decoration:
      lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal);
}
// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

// medium style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

// bold style

TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

// semibold style

TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s12,
  required Color color,
  bool italic = false,
  bool lineThrough = false,
}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color,
      italic: italic,lineThrough: lineThrough);
}
