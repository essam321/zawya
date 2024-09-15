import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String data;
  final Color color;

  final String font;
  final double size;
  final int align;
  final int fontWeight;

  const CustomText(
      {super.key,
      required this.data,
      required this.color,
      this.font = 'Tajawal_Regular',
      this.size = 22,
      this.align = 1,
      this.fontWeight = 1});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: TextAlign.values[align],
      style: TextStyle(
        fontWeight: FontWeight.values[fontWeight],
        color: color,
        fontFamily: font,
        fontSize: size,
      ),
    );
  }
}
