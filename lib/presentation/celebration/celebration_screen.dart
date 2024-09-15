import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mind_games/presentation/games/shared/widgets/celebration.dart';
import 'package:mind_games/presentation/main_menu/main_menu.dart';
import 'package:mind_games/presentation/resources/assets.dart';
import 'package:mind_games/presentation/resources/colors.dart';
import 'package:mind_games/presentation/resources/objects.dart';
import 'package:mind_games/presentation/resources/strings.dart';

class CelebrationScreen extends StatelessWidget {
  CelebrationScreen({
    super.key,
    required this.returnMenu,
    required this.progress,
  });

  final void Function() returnMenu;
  final void Function() progress;

  final AppColors _colors = AppColors();
  final AppStrings _strings = AppStrings();
  final ImageAssets _assets = ImageAssets();
  final GamesObjects _gamesObjects = GamesObjects();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: _colors.primaryColor,
      body: Stack(
        children: [
          Celebration(w),
          Center(
            child: Container(
              width: 340,
              height: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(27),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/img/win.png'),
                  Row(
                    mainAxisAlignment: progress == () {}
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: returnMenu,
                          icon: Container(
                            alignment: Alignment.center,
                            width: 116,
                            height: 52,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: _colors.buttonColor, width: 1),
                                borderRadius: BorderRadius.circular(17),
                                color: Colors.white),
                            child: FaIcon(FontAwesomeIcons.gamepad,
                                color: _colors.buttonColor, size: 35),
                          )),
                      IconButton(
                          onPressed: progress,
                          icon: Container(
                            alignment: Alignment.center,
                            width: 116,
                            height: 52,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                color: _colors.buttonColor),
                            child: Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.white,
                              size: 35,
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
