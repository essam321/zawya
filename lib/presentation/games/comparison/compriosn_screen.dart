import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mind_games/data/sharedPref/app_prefs.dart';
import 'package:mind_games/presentation/celebration/celebration_screen.dart';
import 'package:mind_games/presentation/games/comparison/board_builder.dart';
import 'package:mind_games/presentation/games/final_test/final_test.dart';
import 'package:mind_games/presentation/games/math/math_screen.dart';
import 'package:mind_games/presentation/games/shared/widgets/dice.dart';
import 'package:mind_games/presentation/games/shared/widgets/celebration.dart';
import 'package:mind_games/presentation/main_menu/main_menu.dart';
import 'package:mind_games/presentation/resources/assets.dart';
import 'package:mind_games/presentation/resources/colors.dart';
import 'package:mind_games/presentation/resources/objects.dart';
import 'package:mind_games/presentation/resources/strings.dart';

class ComparisonScreen extends StatefulWidget {
  final Map content;

  const ComparisonScreen({super.key, required this.content});

  @override
  State<ComparisonScreen> createState() => _ComparisonScreenState();
}

class _ComparisonScreenState extends State<ComparisonScreen> {
  final ImageAssets _assets = ImageAssets();

  final AppStrings _strings = AppStrings();

  final AppColors _colors = AppColors();

  final AppPrefs _prefs = AppPrefs();

  final GamesObjects _gamesObjects = GamesObjects();

  //color.shuffle();
  bool win = false;
  bool celebration = false;
  List choices = [];
  int i = 3;

  List<bool> selectOrNot = [false, false, false, false];

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    choices = widget.content['choices'];
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
                board(h, w),
                SizedBox(
                  height: h / 4,
                  child: objectsListView(w),
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
                ),
              ],
            ),
            Positioned(
                bottom: h / 3,
                child: Image.asset(
                  widget.content['icons'][1],
                )),
          ],
        ),
      ),
    );
  }

  Padding board(double h, double w) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: h / 2,
        width: w,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage(widget.content['icons'][0]),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.content['dice']
                ? Dice(
                    num: widget.content['equation'][0],
                    dotColor: Colors.white,
                    color: widget.content['color'],
                    height: 55,
                    width: 55)
                : SvgBuilder(
                    path: widget.content['equation'][0],
                    color: widget.content['color'],
                    width: 65),
            const SizedBox(width: 30),
            Container(
              padding: const EdgeInsets.all(15),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(28)),
              child:
                  selectOrNot[i] ? SvgBuilder(path: choices[i]) : Container(),
            ),
            const SizedBox(width: 30),
            widget.content['dice']
                ? Dice(
                    dotColor: Colors.white,
                    num: widget.content['equation'][1],
                    color: widget.content['color'],
                    height: 55,
                    width: 55)
                : SvgBuilder(
                    path: widget.content['equation'][1],
                    color: widget.content['color'],
                    width: 65,
                  ),
          ],
        ),
      ),
    );
  }

  Widget objectsListView(w) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: widget.content['length'],
      itemBuilder: (context, index) => MaterialButton(
        padding: const EdgeInsets.all(15),
        onPressed: () {
          i = index;
          setState(() {
            selectOrNot.fillRange(0, selectOrNot.length, false);
            selectOrNot[index] = true;
            if (choices[index] == widget.content['answer']) {
              win = true;
              _prefs.setGameState(
                  gameName: widget.content['nav'], state: false);
              _prefs.setGameState(
                  gameName: _strings.plusAndMinus, state: false);

              Future.delayed(
                const Duration(seconds: 2),
                () {
                  if (widget.content['nav'] == 'final' && win == true) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              finalTest(widget.content['next']),
                        ));
                  } else if (widget.content['nav'] == _strings.mainMenu &&
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
                                    builder: (context) => MathScreen(content: _gamesObjects.math['1p']),
                                  ));
                            },
                          ),
                        ));


                  } else if (widget.content['nav'] != '' && win == true) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ComparisonScreen(
                              content: _gamesObjects
                                  .comparison[widget.content['nav']]),
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
          child: selectOrNot[index]
              ? Container()
              : SvgBuilder(path: choices[index]),
        ),
      ),
    );
  }
}
