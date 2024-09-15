import 'package:flutter/material.dart';
import 'package:mind_games/presentation/common/custom_text.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final CustomText text;
  final double minWidth;
  final double height;
  final void Function() fun;

  const CustomButton(
      {super.key,
      required this.fun,
      this.color = const Color(0xfff16f50),
      required this.text,
      this.height = 50,
      this.minWidth = 340});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: fun,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 10,
      height: height,
      minWidth: minWidth,
      color: color,
      child: text,
    );
  }
}
