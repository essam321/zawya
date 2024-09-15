import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mind_games/data/sharedPref/app_prefs.dart';
import 'package:mind_games/presentation/celebration/celebration_screen.dart';
import 'package:mind_games/presentation/games/final_test/final_test.dart';
import 'package:mind_games/presentation/games/memory/memory_screen.dart';
import 'package:mind_games/presentation/games/shared/widgets/celebration.dart';
import 'package:mind_games/presentation/main_menu/main_menu.dart';
import 'package:mind_games/presentation/resources/assets.dart';
import 'package:mind_games/presentation/resources/colors.dart';
import 'package:mind_games/presentation/resources/objects.dart';
import 'package:mind_games/presentation/resources/strings.dart';

class SelectionScreen extends StatefulWidget {
  final Map content;
  final WhatShape kind;

  const SelectionScreen({super.key, required this.content, required this.kind});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  final ImageAssets _assets = ImageAssets();

  final AppStrings _strings = AppStrings();

  final AppColors _colors = AppColors();

  final AppPrefs _prefs = AppPrefs();

  final GamesObjects _gamesObjects = GamesObjects();

  //color.shuffle();
  bool win = false;
  bool celebration = false;
  List choices = [];

  List<bool> selectOrNot = [false, false, false];

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    choices = widget.content['choices'];
    choices.shuffle();
  }

  int counter = 0;

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
          children: [
            celebration ? Celebration(w) : Container(),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    height: h / 2,
                    child: Image.asset(win
                        ? widget.content['icons'][1]
                        : widget.content['icons'][0])),
                SizedBox(
                  height: h / 4,
                  child: widget.kind == WhatShape.colors
                      ? colorsListView(h,w)
                      : widget.kind == WhatShape.shapes
                          ? shapesListView(h,w)
                          : objectsListView(h,w),
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
                                content: _gamesObjects
                                    .allChoices[_strings.mainMenu]),
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
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget colorsListView(h,w) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: widget.content['length'],
      itemBuilder: (context, index) => MaterialButton(
        padding: const EdgeInsets.all(15),
        onPressed: () {
          setState(() {
            selectOrNot.fillRange(0, selectOrNot.length, false);
            selectOrNot[index] = true;

            if (choices[index] == widget.content['answer']) {
              win = true;
              _prefs.setGameState(gameName: _strings.shapes, state: false);
              Future.delayed(
                const Duration(seconds: 2),
                () {
                  if (widget.content['nav'] == _strings.finishColors &&
                      win == true) {
                    // Celebration Screen
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
                                        _gamesObjects.allChoices[_strings.mainMenu]),
                                  ),
                                  (route) => false);
                            },
                            progress: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SelectionScreen(
                                      content: _gamesObjects
                                          .selection[_strings.triangle],
                                      kind: WhatShape.shapes,
                                    ),
                                  ));
                            },
                          ),
                        ));
                  } else if (widget.content['nav'] == 'final' && win == true) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              finalTest(widget.content['next']),
                        ));
                  } else if (widget.content['nav'] != '' && win == true) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectionScreen(
                              content: _gamesObjects
                                  .selection[widget.content['nav']],
                              kind: WhatShape.colors),
                        ));
                  }
                },
              );
            } else {
              win = false;
            }
          });

          Future.delayed(
            const Duration(milliseconds: 10),
            () {
              setState(() {
                win ? celebration = true : celebration = false;
              });
            },
          );
        },
        child: Container(
          alignment: Alignment.center,
          width: w/4,
          height: 104,
          decoration: BoxDecoration(
              color: selectOrNot[index] == false
                  ? Colors.white
                  : _colors.selectedPurple,
              borderRadius: BorderRadius.circular(35)),
          child: Container(
              width: w/8,
              height:50,
              decoration: BoxDecoration(
                boxShadow: selectOrNot[index] == true
                    ? [
                        BoxShadow(
                            color: _colors.shadow,
                            blurRadius: 4,
                            offset: const Offset(0, 4))
                      ]
                    : [],
                borderRadius: BorderRadius.circular(8),
                color: choices[index],
              )),
        ),
      ),
    );
  }

  Widget shapesListView(h,w) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: widget.content['length'],
      itemBuilder: (context, index) => MaterialButton(
        padding: const EdgeInsets.all(15),
        onPressed: () {
          setState(() {
            selectOrNot.fillRange(0, selectOrNot.length, false);
            selectOrNot[index] = true;
            if (choices[index] == widget.content['answer']) {
              win = true;
              _prefs.setGameState(
                  gameName: widget.content['nav'], state: false);
              Future.delayed(
                const Duration(seconds: 2),
                () {
                  if (widget.content['nav'] == _strings.relations &&
                      win == true) {
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
                                        _gamesObjects.allChoices[_strings.mainMenu]),
                                  ),
                                  (route) => false);
                            },
                            progress: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SelectionScreen(
                                      content: _gamesObjects
                                          .selection[_strings.book],
                                      kind: WhatShape.objects,
                                    ),
                                  ));
                            },
                          ),
                        ));
                  } else if (widget.content['nav'] == 'final' && win == true) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              finalTest(widget.content['next']),
                        ));
                  } else if (widget.content['nav'] != '' && win == true) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectionScreen(
                              content: _gamesObjects
                                  .selection[widget.content['nav']],
                              kind: WhatShape.shapes),
                        ));
                  }
                },
              );
            } else {
              win = false;
            }
          });
          Future.delayed(
            const Duration(milliseconds: 10),
            () {
              setState(() {
                win ? celebration = true : celebration = false;
              });
            },
          );
        },
        child: Container(
          alignment: Alignment.center,
          width: w/4,
          height: 104,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(35)),
          child: selectOrNot[index] == false
              ? Image.asset(choices[index], scale: 3)
              : Container(),
        ),
      ),
    );
  }

  Widget objectsListView(h,w) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: widget.content['length'],
      itemBuilder: (context, index) => MaterialButton(
        padding: const EdgeInsets.all(15),
        onPressed: () {
          setState(() {
            selectOrNot.fillRange(0, selectOrNot.length, false);
            selectOrNot[index] = true;
            if (choices[index] == widget.content['answer']) {
              win = true;

              _prefs.setGameState(
                  gameName: widget.content['nav'], state: false);

              Future.delayed(
                const Duration(seconds: 2),
                () {
                  if (widget.content['nav'] == _strings.cards && win == true) {
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
                                        _gamesObjects.allChoices[_strings.mainMenu]),
                                  ),
                                  (route) => false);
                            },
                            progress: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MemoryScreen(),
                                  ));
                            },
                          ),
                        ));
                  } else if (widget.content['nav'] == 'final' && win == true) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              finalTest(widget.content['next']),
                        ));
                  } else if (widget.content['nav'] != '' && win == true) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectionScreen(
                              content: _gamesObjects
                                  .selection[widget.content['nav']],
                              kind: WhatShape.objects),
                        ));
                  }
                },
              );
            } else {
              win = false;
            }
          });
          Future.delayed(
            const Duration(milliseconds: 10),
            () {
              setState(() {
                win ? celebration = true : celebration = false;
              });
            },
          );
        },
        child: Container(
          alignment: Alignment.center,
          width: w/4,
          height: 104,
          decoration: BoxDecoration(
              color: selectOrNot[index] == true
                  ? _colors.selectedPurple
                  : Colors.white,
              borderRadius: BorderRadius.circular(35)),
          child: Image.asset(choices[index]),
        ),
      ),
    );
  }
}
