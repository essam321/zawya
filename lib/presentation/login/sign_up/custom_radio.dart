import 'package:flutter/material.dart';
import 'package:mind_games/presentation/common/custom_text.dart';
import 'package:mind_games/presentation/resources/colors.dart';
import 'package:mind_games/presentation/resources/strings.dart';

class CustomRadioButtons extends StatefulWidget {
  const CustomRadioButtons({super.key});

  @override
  State<CustomRadioButtons> createState() => _CustomRadioButtonsState();
}

class _CustomRadioButtonsState extends State<CustomRadioButtons> {
  final AppColors _colors = AppColors();
  final AppStrings _strings = AppStrings();

  bool femaleSelected = false;
  bool maleSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            CustomText(
                fontWeight: 7,
                size: 16,
                data: _strings.male,
                color:
                    maleSelected ? Colors.black : const Color.fromRGBO(0, 0, 0, 0.4)),
            MaterialButton(
              elevation: 0,
              padding: const EdgeInsets.all(5),
              minWidth: 1,
              color: Colors.white,
              shape: const CircleBorder(),
              onPressed: () {
                setState(() {
                  maleSelected = true;
                  femaleSelected = !maleSelected;
                });
              },
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                    color: maleSelected ? _colors.buttonColor : Colors.white,
                    shape: BoxShape.circle),
              ),
            ),
          ],
        ),
        Row(
          children: [
            CustomText(
                fontWeight: 7,
                size: 16,
                data: _strings.female,
                color: femaleSelected
                    ? Colors.black
                    : const Color.fromRGBO(0, 0, 0, 0.4)),
            MaterialButton(
              elevation: 0,
              padding: const EdgeInsets.all(5),
              minWidth: 1,
              color: Colors.white,
              shape: const CircleBorder(),
              onPressed: () {
                setState(() {
                  femaleSelected = true;
                  maleSelected = !femaleSelected;
                });
              },
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                    color: femaleSelected ? _colors.buttonColor : Colors.white,
                    shape: BoxShape.circle),
              ),
            ),
          ],
        ),
        CustomText(
            fontWeight: 7,
            size: 16,
            data: _strings.type,
            color: const Color.fromRGBO(0, 0, 0, 0.4))
      ],
    );
  }
}
