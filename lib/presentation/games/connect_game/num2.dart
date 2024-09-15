import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mind_games/data/sharedPref/app_prefs.dart';
import 'package:mind_games/presentation/games/comparison/board_builder.dart';
import 'package:mind_games/presentation/games/shared/widgets/celebration.dart';
import 'package:mind_games/presentation/main_menu/main_menu.dart';
import 'package:mind_games/presentation/resources/assets.dart';
import 'package:mind_games/presentation/resources/colors.dart';
import 'package:mind_games/presentation/resources/objects.dart';
import 'package:mind_games/presentation/resources/strings.dart';

GamesObjects _gamesObjects = GamesObjects();

class Number2 extends StatefulWidget {
  Number2({super.key});

  final Map content = _gamesObjects.connect['2'];

  @override
  State<Number2> createState() => _Number2State();
}

class _Number2State extends State<Number2> {
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
                // fit:BoxFit.fitHeight,
                height: h / 1.7,
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
              top: h / targetHeightRatio,
              left: w / targetWidthRatio,
              child: DragTarget<String>(
                onAcceptWithDetails: (data) {
                  setState(() {
                    win = true;
                    celebration = true;
                    len = 4;
                    targetHeightRatio = 1.25;
                    targetWidthRatio = 11;
                    dragHeightRatio = 1.3;
                    _prefs.setGameState(gameName: '3', state: false);
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
                  return win == true
                      ? Transform.rotate(
                          angle: 0,
                          child: Image.asset(
                            widget.content['target'],
                            width: 35,
                          ))
                      : Image.asset(widget.content['target']);
                },
              ),
            ),
            Positioned(
              top: h / dragHeightRatio,
              left: w / dragWidthRatio,
              child: Draggable<String>(
                  axis: Axis.values[axisDir],
                  onDragUpdate: (details) {
                    var dy = details.globalPosition.dy;
                    var dx = details.globalPosition.dx;
                    setState(() {
                      if (dy >= h / 1.5) {
                        len = 4;
                      } else if (dy >= h / 2.0) {
                        len = 3;
                        dragHeightRatio = 2.1;
                      } else if (dx <= w / 4.0) {
                        len = 2;
                        dragWidthRatio = 6.5;
                        axisDir = 1;
                      } else {
                        setState(() {
                          len = 1;
                          dragHeightRatio = 4.5;
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
          ],
        ),
      ),
    );
  }
}
