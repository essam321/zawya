import 'package:flutter/material.dart';
import 'package:mind_games/presentation/common/custom_button.dart';
import 'package:mind_games/presentation/common/custom_text.dart';
import 'package:mind_games/presentation/resources/colors.dart';
import 'package:mind_games/presentation/resources/strings.dart';

class CustomDialogWidget extends StatelessWidget {
  CustomDialogWidget({super.key});

  final AppStrings _strings = AppStrings();
  final AppColors _colors = AppColors();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 255,
        width: 340,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomText(
              data: _strings.wantToLogOut,
              color: _colors.textColor,
              size: 26,
              fontWeight: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                    height: 40,
                    minWidth: 120,
                    fun: () {},
                    text: CustomText(
                      data: _strings.no,
                      color: Colors.white,
                      size: 26,
                      fontWeight: 7,
                    )),
                CustomButton(
                    height: 40,
                    minWidth: 120,
                    fun: () {},
                    text: CustomText(
                      data: _strings.yes,
                      color: Colors.white,
                      size: 26,
                      fontWeight: 7,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
