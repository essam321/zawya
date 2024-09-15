import 'package:flutter/material.dart';
import 'package:mind_games/presentation/common/bubble.dart';
import 'package:mind_games/presentation/common/custom_clipper.dart';
import 'package:mind_games/presentation/common/custom_text.dart';
import 'package:mind_games/presentation/resources/colors.dart';
import 'package:mind_games/presentation/resources/font.dart';

class OnboardingBody extends StatelessWidget {
  OnboardingBody({
    super.key,
    required this.color,
    required this.image,
    required this.t1,
    required this.t2,
  });

  final Color color;
  final String image;
  final String t1;
  final String t2;
  final AppColors _appColors = AppColors();
  final AppFonts _fonts = AppFonts();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Stack(
        children: [
          CustomPaint(
            size: const Size(double.infinity, 200),
            painter: TopCustomPainter(),
          ),
          Container(
            alignment: const Alignment(0, 1),
            child: CustomPaint(
              size: const Size(double.infinity, 1200),
              painter: BottomCustomPainter(),
            ),
          ),
          Container(
            alignment: const Alignment(-0.5, .4),
            child: const Bubble(60, 60),
          ),
          Container(
            alignment: const Alignment(-0.9, .6),
            child: const Bubble(40, 40),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 20, child: Image.asset(image)),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: CustomText(
                      data: t1,
                      color: _appColors.h1Text,
                      font: _fonts.Tajawal_Bold),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: CustomText(
                    data: t2,
                    color: _appColors.h2Text,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
