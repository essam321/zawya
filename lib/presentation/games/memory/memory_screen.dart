import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mind_games/data/sharedPref/app_prefs.dart';
import 'package:mind_games/models/game.dart';
import 'package:mind_games/presentation/celebration/celebration_screen.dart';
import 'package:mind_games/presentation/celebration/graduation_screen.dart';
import 'package:mind_games/presentation/games/connect_game/num1.dart';
import 'package:mind_games/presentation/games/memory/match_page.dart';
import 'package:mind_games/presentation/games/shared/widgets/celebration.dart';
import 'package:mind_games/presentation/main_menu/main_menu.dart';
import 'package:mind_games/presentation/resources/assets.dart';
import 'package:mind_games/presentation/resources/colors.dart';
import 'package:mind_games/presentation/resources/objects.dart';
import 'package:mind_games/presentation/resources/strings.dart';

class MemoryScreen extends StatefulWidget {
  const MemoryScreen({super.key, this.index = 0});

  final int index;

  @override
  State<MemoryScreen> createState() => _MemoryScreenState();
}

class _MemoryScreenState extends State<MemoryScreen> {
  bool win = false;

  final AppPrefs _prefs = AppPrefs();

  final AppColors _colors = AppColors();
  final ImageAssets _assets = ImageAssets();
  final AppStrings _strings = AppStrings();
  final GamesObjects _objects = GamesObjects();
  bool celebration = false;
  Timer? timer;
  Game? game;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    game = Game(gridSize: 2, index: widget.index);
    startTimer();
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        game!.time = game!.time + 1;
      });
      if (game!.gameOver) {
        timer.cancel();
      }

      if (game!.gameOver) {
        _prefs.setGameState(gameName: _strings.numbers, state: false);
        Future.delayed(const Duration(seconds: 1), () {
          if (widget.index == 3) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => GraduationScreen(),
                ));
          } else {

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => CelebrationScreen(
                    returnMenu: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainScreen(
                                circleIcon: false,
                                mainLabel: _strings.mainMenu,
                                mainIcon: _assets.gameController,
                                content:
                                _objects.allChoices[_strings.mainMenu]),
                          ),
                              (route) => false);
                    },
                    progress: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Number1(),
                          ));
                    },
                  ),
                ));

          }
        });
      } else if (widget.index == 3 && win == true) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MemoryScreen(
                index: 3,
              ),
            ));
      }
    });
  }

  // void _resetGame() {
  //   game!.resetGame();
  //   setState(() {
  //     timer!.cancel();
  //     startTimer();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                stops: const [0.45, 1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [_colors.darkBlue, _colors.lightBlue])),
        child: Stack(
          children: [
            game!.gameOver ? Celebration(w) : Container(),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // GameTimer(time: game!.time),
                SizedBox(
                  height: 700,
                  child: MemoryMatchPage(game: game!),
                ),
                SizedBox(
                    height: h / 10,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainScreen(
                                  circleIcon: false,
                                  mainLabel: _strings.games,
                                  mainIcon: _assets.gameController,
                                  content:
                                      _objects.allChoices[_strings.mainMenu]),
                            ),
                            (route) => false);
                      },
                      icon: FaIcon(FontAwesomeIcons.gamepad,
                          shadows: [
                            Shadow(
                                offset: const Offset(0, 4),
                                blurRadius: 4,
                                color: _colors.shadow),
                          ],
                          color: Colors.white,
                          size: 35),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
