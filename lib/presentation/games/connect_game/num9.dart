import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mind_games/data/sharedPref/app_prefs.dart';
import 'package:mind_games/presentation/celebration/celebration_screen.dart';
import 'package:mind_games/presentation/games/comparison/board_builder.dart';
import 'package:mind_games/presentation/games/lets_count/lets_count_screen.dart';
import 'package:mind_games/presentation/games/shared/widgets/celebration.dart';
import 'package:mind_games/presentation/main_menu/main_menu.dart';
import 'package:mind_games/presentation/resources/assets.dart';
import 'package:mind_games/presentation/resources/colors.dart';
import 'package:mind_games/presentation/resources/objects.dart';
import 'package:mind_games/presentation/resources/strings.dart';

GamesObjects _gamesObjects = GamesObjects();

class Number9 extends StatefulWidget {
  Number9({super.key});

  final Map content = _gamesObjects.connect['9'];

  @override
  State<Number9> createState() => _Number9State();
}

class _Number9State extends State<Number9> {
  @override
  void initState() {
    super.initState();
    dragWidthRatio = widget.content['dragPosition']['width'];
    dragHeightRatio = widget.content['dragPosition']['height'];

    targetWidthRatio = widget.content['targetPosition']['width'];
    targetHeightRatio = widget.content['targetPosition']['height'];
  }

  bool win = false;
  bool celebration = false;
  final AppColors _colors = AppColors();
  final AppPrefs _prefs = AppPrefs();
  final AppStrings _strings = AppStrings();
  final GamesObjects _gamesObjects = GamesObjects();
  final ImageAssets _assets = ImageAssets();
  late double dragWidthRatio;
  late double dragHeightRatio;
  late double targetWidthRatio;
  late double targetHeightRatio;

  int len = 1;
  int axisDir = 0;

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
                colors: widget.content['gradient'])),
        child: Stack(
          alignment: Alignment.center,
          children: [
            celebration ? Celebration(w) : Container(),
            SizedBox(
                child: SvgBuilder(
              path: widget.content['progress'][len - 1],
              // fit: BoxFit.fitHeight,
              height: h / 1.7,
              width: w,
            )),
            Positioned(
              bottom: 10,
              child: SizedBox(
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
                              content: _gamesObjects
                                  .allChoices[_strings.mainMenu]),
                        ),
                            (route) => false);                  },
                  icon: FaIcon(FontAwesomeIcons.gamepad,
                      shadows: [
                        Shadow(
                            offset: const Offset(0, 4),
                            blurRadius: 4,
                            color: _colors.shadow),
                      ],
                      color: Colors.white,
                      size: 35),
                ),
              ),
            ),
            Positioned(
              top: h / targetHeightRatio,
              left: w / targetWidthRatio,
              child: DragTarget<String>(
                onAcceptWithDetails: (data) {
                  setState(() {
                    win = true;
                    celebration = true;
                    targetHeightRatio = 1.25;
                    targetWidthRatio = 1.55;
                    len = 5;


                    _prefs.setGameState(gameName: _strings.letsCount, state: false);
                    Future.delayed(
                      const Duration(seconds: 1),
                          () =>  Navigator.pushReplacement(
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
                                              _gamesObjects.allChoices[_strings.mainMenu]),
                                        ),
                                            (route) => false);
                                  },
                                  progress: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LetsCountScreen(content: _gamesObjects.letsCount['1']),
                                        ));
                                  },
                                ),
                              )),
                    );
                  });



                },
                builder: (context, candidateData, rejectedData) {
                  return win == true
                      ? Image.asset(
                          widget.content['target'][1],
                          width: 75,
                        )
                      : Image.asset(
                          widget.content['target'][0],
                          width: 80,
                        );
                },
              ),
            ),
            Positioned(
              top: h / dragHeightRatio,
              left: w / dragWidthRatio,
              child: win == true
                  ? const SizedBox()
                  : Draggable<String>(
                      onDragUpdate: (details) {
                        var dy = details.globalPosition.dy;
                        var dx = details.globalPosition.dx;
                        setState(() {
                          if (dx >= w / 1.7 && dy >= h / 2.0 && len >= 4) {
                            len = 5;
                            dragWidthRatio = 1.55;
                            dragHeightRatio = 1.6;
                          } else if (dx >= w / 1.7 &&
                              dy >= h / 2.3 &&
                              len >= 3) {
                            len = 4;
                            dragWidthRatio = 1.55;
                            dragHeightRatio = 2.2;
                          } else if (dy <= h / 3.5 &&
                              dx <= w / 2.0 &&
                              len >= 2) {
                            len = 3;
                            dragWidthRatio = 2.3;
                            dragHeightRatio = 4.5;
                          } else if (dy <= h / 2.5 && dx <= w / 3.0) {
                            len = 2;
                            dragWidthRatio = 4.0;
                            dragHeightRatio = 2.8;
                          } else {
                            setState(() {
                              dragWidthRatio =
                                  widget.content['dragPosition']['width'];
                              dragHeightRatio =
                                  widget.content['dragPosition']['height'];
                            });
                          }
                        });
                      },
                      data: widget.content['drag'],
                      feedback: Image.asset(widget.content['drag']),
                      childWhenDragging: Container(),
                      child: Image.asset(widget.content['drag'])),
            ),
            const SizedBox(
              height: 50,
            ),

            // SizedBox(
            //  //   child: layout(w)
            // ),
            // SizedBox(
            //     width: double.infinity,
            //     height: h / 4,
            //    // child: choicesListView(w)
            //   // widget.kind == whatShape.colors
            //   //     ? colorsListView()
            //   //     : widget.kind == whatShape.shapes
            //   //     ? shapesListView()
            //   //     : objectsListView(),
            // ),
          ],
        ),
      ),
    );
  }
}
