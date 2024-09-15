import 'package:flutter/material.dart';
import 'package:mind_games/presentation/games/shared/widgets/celebration.dart';
import 'package:mind_games/presentation/main_menu/main_menu.dart';
import 'package:mind_games/presentation/resources/assets.dart';
import 'package:mind_games/presentation/resources/colors.dart';
import 'package:mind_games/presentation/resources/objects.dart';
import 'package:mind_games/presentation/resources/strings.dart';

class GraduationScreen extends StatelessWidget {
  GraduationScreen({super.key});

  final AppColors _colors = AppColors();
  final AppStrings _strings = AppStrings();
  final ImageAssets _assets = ImageAssets();
  final GamesObjects _gamesObjects = GamesObjects();

  void next(context) {
    Future.delayed(
      Duration(seconds: 1),
      () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(
                circleIcon: false,
                mainLabel: _strings.games,
                mainIcon: _assets.gameController,
                content: _gamesObjects.allChoices[_strings.mainMenu]),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    next(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: _colors.primaryColor,
      body: Stack(
        children: [
          Celebration(w),
          Center(
            child: Image.asset('assets/img/graduated.png'),
          ),
        ],
      ),
    );
  }
}
