import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mind_games/data/sharedPref/app_prefs.dart';
import 'package:mind_games/presentation/celebration/celebration_screen.dart';
import 'package:mind_games/presentation/games/comparison/board_builder.dart';
import 'package:mind_games/presentation/games/comparison/compriosn_screen.dart';
import 'package:mind_games/presentation/games/final_test/final_test.dart';
import 'package:mind_games/presentation/games/shared/widgets/celebration.dart';
import 'package:mind_games/presentation/main_menu/main_menu.dart';
import 'package:mind_games/presentation/resources/assets.dart';
import 'package:mind_games/presentation/resources/colors.dart';
import 'package:mind_games/presentation/resources/objects.dart';
import 'package:mind_games/presentation/resources/strings.dart';

class LetsOrderScreen extends StatefulWidget {
  LetsOrderScreen({super.key, required this.content}) {
    choices = content['choices'];
    choices.shuffle();
  }

  List choices = [];
  final Map content;

  @override
  State<LetsOrderScreen> createState() => _LetsOrderScreenState();
}

class _LetsOrderScreenState extends State<LetsOrderScreen> {
  bool win = false;
  bool celebration = false;
  final AppStrings _strings = AppStrings();
  final AppColors _colors = AppColors();
  final AppPrefs _prefs = AppPrefs();
  final ImageAssets _assets = ImageAssets();
  final GamesObjects _gamesObjects = GamesObjects();
  List<bool> selectOrNot = [false, false, false];

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
            SizedBox(
              height: h,
              width: w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(child: layout(w)),
                  SizedBox(
                      width: double.infinity,
                      height: h / 4,
                      child: choicesListView(w)),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget choicesListView(w) {
    return ListView.builder(
      itemExtent: w / 3,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) => MaterialButton(
        padding: const EdgeInsets.all(5),
        onPressed: () {
          setState(() {
            selectOrNot.fillRange(0, selectOrNot.length, false);
            selectOrNot[index] = true;
            if (widget.choices[index] == widget.content['answer']) {
              win = true;
              _prefs.setGameState(
                  gameName: widget.content['nav'], state: false);
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
                  } else if (widget.content['nav'] != _strings.letsOrder &&
                      widget.content['nav'] != _strings.mainMenu &&
                      win == true) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LetsOrderScreen(
                              content: _gamesObjects
                                  .letsOrder[widget.content['nav']]),
                        ));
                  } else if (widget.content['nav'] == _strings.letsOrder &&
                      win == true) {
                    _prefs.setGameState(
                        gameName: _strings.descending, state: false);

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CelebrationScreen(
                            returnMenu: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainScreen(
                                        circleIcon: true,
                                        mainLabel: _strings.letsPlay,
                                        mainIcon: _assets.playing,
                                        content: _gamesObjects
                                            .allChoices[_strings.letsPlay]),
                                  ),
                                  (route) => false);
                            },
                            progress: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LetsOrderScreen(
                                        content: _gamesObjects.letsOrder['3']),
                                  ));
                            },
                          ),
                        ));

                    //
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => MainScreen(
                    //             circleIcon: true,
                    //             mainLabel: _strings.letsOrder,
                    //             mainIcon: _assets.growth2,
                    //             content: _gamesObjects
                    //                 .allChoices[_strings.letsOrder])));
                  } else if (widget.content['nav'] == _strings.mainMenu &&
                      win == true) {
                    _prefs.setGameState(
                        gameName: _strings.bigAndSmall, state: false);

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CelebrationScreen(
                            returnMenu: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainScreen(
                                        circleIcon: true,
                                        mainLabel: _strings.letsPlay,
                                        mainIcon: _assets.playing,
                                        content: _gamesObjects
                                            .allChoices[_strings.letsPlay]),
                                  ),
                                  (route) => false);
                            },
                            progress: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ComparisonScreen(
                                        content: _gamesObjects
                                            .comparison['lessThan']),
                                  ));
                            },
                          ),
                        ));

                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => MainScreen(
                    //             circleIcon: false,
                    //             mainLabel: _strings.games,
                    //             mainIcon: _assets.gameController,
                    //             content: _gamesObjects
                    //                 .allChoices[_strings.mainMenu])));
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
            width: 104,
            height: 104,
            decoration: BoxDecoration(
                color: selectOrNot[index] == true
                    ? widget.content['color']
                    : Colors.white,
                borderRadius: BorderRadius.circular(35)),
            child: SvgBuilder(
              width: 50,
              height: 50,
              path: widget.choices[index],
              color: selectOrNot[index] == true
                  ? Colors.white
                  : widget.content['color'],
            )),
      ),
    );
  }

  Widget layout(w) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
              right: (w / 12) + 210,
              child: Container(
                  alignment: Alignment.center,
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                    _assets.tail,
                  ))),
                  child: Text(
                    '......',
                    style: TextStyle(
                        fontSize: 40,
                        color: widget.content['progressiveColor']),
                  ))),
          Positioned(
            right: (w / 12) + 140,
            child: Container(
                alignment: Alignment.center,
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(_assets.yellowCircle))),
                child: SvgBuilder(
                  width: 35,
                  height: 35,
                  path: widget.content['progressive'][2],
                  color: widget.content['progressiveColor'],
                )),
          ),
          Positioned(
              right: (w / 12) + 70,
              child: Container(
                alignment: Alignment.center,
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(_assets.yellowCircle))),
                child: SvgBuilder(
                  width: 35,
                  height: 35,
                  path: widget.content['progressive'][1],
                  color: widget.content['progressiveColor'],
                ),
              )),
          Positioned(
              right: w / 12,
              child: Container(
                  alignment: Alignment.center,
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(_assets.yellowCircle))),
                  child: SvgBuilder(
                    width: 35,
                    height: 35,
                    path: widget.content['progressive'][0],
                    color: widget.content['progressiveColor'],
                  ))),
          Positioned(right: -35, child: Image.asset(_assets.wormFace)),
        ],
      ),
    );
  }
}
