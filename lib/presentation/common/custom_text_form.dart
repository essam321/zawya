import 'package:flutter/material.dart';
import 'package:mind_games/presentation/resources/colors.dart';
import 'package:mind_games/presentation/resources/font.dart';


class CustomTextForm extends StatelessWidget {
  final String hintText;
  final Icon suffixIcon;
  final TextInputType textInputType;
  final bool obscureText;
  final bool enabled;
  final double height;

  CustomTextForm(
      {super.key, required this.hintText,
      required this.suffixIcon,
      required this.height,
      this.textInputType = TextInputType.name,
      this.obscureText = false,
      this.enabled = true});

  final AppColors _colors = AppColors();

  final AppFonts _fonts = AppFonts();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height/10,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: TextFormField(
        enabled: enabled,
        obscuringCharacter: '⬤',
        cursorColor: _colors.buttonColor,
        style: TextStyle(
          fontFamily: _fonts.Tajawal_Regular,
          color: _colors.grayColor,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        obscureText: obscureText,
        keyboardType: textInputType,
        textAlign: TextAlign.end,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade400,
                fontFamily: _fonts.Tajawal_Bold),
            hintText: hintText,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
