import 'dart:math' as math; // import this
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mind_games/data/sharedPref/app_prefs.dart';
import 'package:mind_games/presentation/games/shared/widgets/celebration.dart';
import 'package:mind_games/presentation/main_menu/main_menu.dart';
import 'package:mind_games/presentation/resources/assets.dart';
import 'package:mind_games/presentation/resources/colors.dart';
import 'package:mind_games/presentation/resources/objects.dart';
import 'package:mind_games/presentation/resources/strings.dart';

GamesObjects _gamesObjects = GamesObjects();

class Number4 extends StatefulWidget {
  Number4({super.key});

  final Map content = _gamesObjects.connect['4'];

  @override
  State<Number4> createState() => _Number4State();
}

class _Number4State extends State<Number4> {
  @override
  void initState() {
    // TODO: implement initState
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
              child: Image.asset(
                widget.content['progress'][len - 1],
                height: h / 2,
                width: w,
              ),
            ),
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
              left: w / targetWidthRatio,
              top: h / targetHeightRatio,
              child: DragTarget<String>(
                onAcceptWithDetails: (data) {
                  setState(() {
                    targetWidthRatio = 1.3;
                    targetHeightRatio = 1.3;
                    dragWidthRatio = 1.9;
                    dragHeightRatio = 1.35;
                    win = true;
                    celebration = true;
                    len = 3;
                    _prefs.setGameState(gameName: '5', state: false);
                    Future.delayed(
                      const Duration(seconds: 1),
                          () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainScreen(
                                circleIcon: true,
                                mainLabel: _strings.numbers,
                                mainIcon: _assets.numberBlocks,
                                content:
                                _gamesObjects.allChoices[_strings.numbers]),
                          )),
                    );
                  });

                },
                builder: (context, candidateData, rejectedData) {
                  return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(len != 3 ? 0 : math.pi),
                      child: Image.asset(widget.content['target']));
                },
              ),
            ),
            Positioned(
              left: w / dragWidthRatio,
              top: h / dragHeightRatio,
              child: Draggable<String>(
                  onDragUpdate: (details) {
                    var dy = details.globalPosition.dy;
                    var dx = details.globalPosition.dx;
                    setState(() {
                      if (dy > h / 1.5 && dx > w / 1.5 && len >= 2) {
                        len = 3;
                        dragWidthRatio = 1.5;
                        dragHeightRatio = 1.5;
                      } else if (dy > h / 2.3 &&
                          dx > w / dragWidthRatio &&
                          len >= 1) {
                        len = 2;
                        dragWidthRatio = dragWidthRatio;
                        dragHeightRatio = 2.3;
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
                  feedback: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(len == 1 ? 0 : math.pi),
                      child: Image.asset(widget.content['drag'])),
                  childWhenDragging: Container(),
                  child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(len != 3 ? 0 : math.pi),
                      child: Image.asset(widget.content['drag']))),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
