import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mind_games/data/sharedPref/app_prefs.dart';
import 'package:mind_games/presentation/celebration/celebration_screen.dart';
import 'package:mind_games/presentation/games/comparison/board_builder.dart';
import 'package:mind_games/presentation/games/final_test/final_test.dart';
import 'package:mind_games/presentation/games/lets_order/lets_order_screen.dart';
import 'package:mind_games/presentation/games/shared/widgets/celebration.dart';
import 'package:mind_games/presentation/main_menu/main_menu.dart';
import 'package:mind_games/presentation/resources/assets.dart';
import 'package:mind_games/presentation/resources/colors.dart';
import 'package:mind_games/presentation/resources/objects.dart';
import 'package:mind_games/presentation/resources/strings.dart';

class LetsCountScreen extends StatefulWidget {
  LetsCountScreen({super.key, required this.content}) {
    choices = content['choices'];
    choices.shuffle();
  }

  late List choices = [];
  final Map content;

  @override
  State<LetsCountScreen> createState() => _LetsCountScreenState();
}

class _LetsCountScreenState extends State<LetsCountScreen> {
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
                  SizedBox(
                      height: h / 2,
                      child: layout(widget.content['length'],
                          widget.content['icons'][0])),
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
                  } else if (widget.content['nav'] != _strings.mainMenu &&
                      win == true) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LetsCountScreen(
                              content: _gamesObjects
                                  .letsCount[widget.content['nav']]),
                        ));
                  } else if (widget.content['nav'] == _strings.mainMenu &&
                      win == true) {
                    _prefs.setGameState(
                        gameName: _strings.letsOrder, state: false);

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
                                    builder: (context) => LetsOrderScreen(
                                        content: _gamesObjects.letsOrder['4']),
                                  ));
                            },
                          ),
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
          width: w/3.7,
          height: 104,
          decoration: BoxDecoration(
              color: selectOrNot[index] == true
                  ? widget.content['color']
                  : Colors.white,
              borderRadius: BorderRadius.circular(35)),
          child: SvgBuilder(
            height: 45,
            width: 45,
            path: widget.choices[index],
            color: selectOrNot[index] == true
                ? Colors.white
                : widget.content['color'],
          ),
        ),
      ),
    );
  }

  Widget layout(int len, String img) {
    switch (len) {
      case 1:
        return Image.asset(img);
      case 2:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(len, (index) => Image.asset(img)),
        );
      case 3:
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              2,
              (index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:
                        List.generate(index + 1, (index) => Image.asset(img)),
                  )),
        );
      case 4:
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              2,
              (index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(2, (index) => Image.asset(img)),
                  )),
        );
      case 5:
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              2,
              (index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:
                        List.generate(2 + index, (index) => Image.asset(img)),
                  )),
        );
      case 6:
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              2,
              (index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(3, (index) => Image.asset(img)),
                  )),
        );
      case 7:
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(img),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(3, (index) => Image.asset(img)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(3, (index) => Image.asset(img)),
            ),
          ],
        );
      case 8:
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(2, (index) => Image.asset(img)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(3, (index) => Image.asset(img)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(3, (index) => Image.asset(img)),
            ),
          ],
        );
      case 9:
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              3,
              (index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(3, (index) => Image.asset(img)),
                  )),
        );

      default:
        return Container();
    }
  }
}
