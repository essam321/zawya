import 'package:flutter/material.dart';
import 'package:mind_games/presentation/common/custom_text.dart';
import 'package:mind_games/presentation/games/comparison/board_builder.dart';
import 'package:mind_games/presentation/games/comparison/compriosn_screen.dart';
import 'package:mind_games/presentation/games/connect_game/num1.dart';
import 'package:mind_games/presentation/games/connect_game/num2.dart';
import 'package:mind_games/presentation/games/connect_game/num3.dart';
import 'package:mind_games/presentation/games/connect_game/num4.dart';
import 'package:mind_games/presentation/games/connect_game/num5.dart';
import 'package:mind_games/presentation/games/connect_game/num6.dart';
import 'package:mind_games/presentation/games/connect_game/num7.dart';
import 'package:mind_games/presentation/games/connect_game/num8.dart';
import 'package:mind_games/presentation/games/connect_game/num9.dart';
import 'package:mind_games/presentation/games/lets_count/lets_count_screen.dart';
import 'package:mind_games/presentation/games/lets_order/lets_order_screen.dart';
import 'package:mind_games/presentation/games/math/math_screen.dart';
import 'package:mind_games/presentation/games/memory/memory_screen.dart';
import 'package:mind_games/presentation/games/selection/choise_screen.dart';
import 'package:mind_games/presentation/main_menu/main_menu.dart';
import 'package:mind_games/presentation/resources/assets.dart';
import 'package:mind_games/presentation/resources/colors.dart';
import 'package:mind_games/presentation/resources/font.dart';
import 'package:mind_games/presentation/resources/objects.dart';
import 'package:mind_games/presentation/resources/strings.dart';

class GamesListView extends StatefulWidget {
  final Map content;

  const GamesListView({super.key, required this.content});

  @override
  State<GamesListView> createState() => _GamesListViewState();
}

class _GamesListViewState extends State<GamesListView> {
  final ImageAssets _assets = ImageAssets();
  final AppStrings _strings = AppStrings();
  final AppColors _colors = AppColors();
  final AppFonts _fonts = AppFonts();
  final GamesObjects _objects = GamesObjects();

  final Map nav = {
    '1': Number1(),
    '2': Number2(),
    '3': Number3(),
    '4': Number4(),
    '5': Number5(),
    '6': Number6(),
    '7': Number7(),
    '8': Number8(),
    '9': Number9(),
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Expanded(
      child: Padding(
        padding: widget.content['length'] == 9
            ? EdgeInsets.symmetric(vertical: height / 10)
            : EdgeInsets.zero,

        // if condition to differentiate between normal list builder and numbers list builder
        child: widget.content['length'] != 9
            ? normalListView(height)
            : numberGridView(height),
      ),
    );
  }

  Widget normalListView(double height) {
    return ListView.builder(
      itemCount: widget.content['length'],
      itemBuilder: (context, index) {
        return MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: () {
            setState(() {
              if (widget.content['lock'][index] == false &&
                  widget.content['nav'][index] != '') {
                switch (widget.content['nav'][index]) {
                  case 'يلا نعد':
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              LetsCountScreen(content: _objects.letsCount['1']),
                        ));
                  case 'frog':
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectionScreen(
                              content: _objects.selection[_strings.frog],
                              kind: WhatShape.colors),
                        ));
                  case "اشكال":
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectionScreen(
                            content: _objects.selection[_strings.triangle],
                            kind: WhatShape.shapes,
                          ),
                        ));
                  case "الصلة":
                    Navigator.pop(context);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectionScreen(
                            content: _objects.selection[_strings.book],
                            kind: WhatShape.objects,
                          ),
                        ));
                  case "superHeroes":
                    Navigator.pop(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MemoryScreen()),
                    );
                  case "تصاعدي":
                    Navigator.pop(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LetsOrderScreen(
                              content: _objects.letsOrder['4'])),
                    );
                  case "تنازلي":
                    Navigator.pop(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LetsOrderScreen(
                              content: _objects.letsOrder['3'])),
                    );
                  case "الكبير والصغير":
                    Navigator.pop(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ComparisonScreen(
                              content: _objects.comparison['lessThan'])),
                    );
                  case "الجمع":
                    Navigator.pop(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MathScreen(content: _objects.math['1p'])),
                    );
                  case "الطرح":
                    Navigator.pop(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MathScreen(content: _objects.math['1m'])),
                    );
                  case "الاختبار النهائى":
                    Navigator.pop(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MathScreen(content: _objects.finalTest['finalMathPlus'])),
                    );

                  default:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(
                              circleIcon: true,
                              mainLabel: widget.content['text'][index],
                              mainIcon: widget.content['icons'][index],
                              content: _objects
                                  .allChoices[widget.content['nav'][index]]),
                        ));
                }
              } else {}
            });
          },
          padding: EdgeInsets.zero,
          child: widget.content['lock'][index] == true
              ? Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  width: 350,
                  height: (height / 1.6) / widget.content['length'],
                  decoration: BoxDecoration(
                      color: _colors.drawerColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Image.asset(_assets.lock),
                )
              : Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  width: 350,
                  height: (height / 1.6) / widget.content['length'],
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(
                        font: _fonts.Tajawal_Bold,
                        data: widget.content['text'][index],
                        color: _colors.textColor,
                        size: 25,
                        fontWeight: 7,
                      ),
                      const SizedBox(width: 40),
                      Image.asset(
                        widget.content['icons'][index],
                        width: 50,
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget numberGridView(double height) {
    return GridView.builder(
        physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
        itemCount: widget.content['length'],
        itemBuilder: (context, index) {
          return MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onPressed: () {
              setState(() {
                if (widget.content['lock'][index] == false &&
                    widget.content['nav'][index] != '') {
                  // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                  //   builder: (context) => nav[widget.content['nav'][index]],), (
                  //     route) => false);

                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => nav[widget.content['nav'][index]],
                      ));
                } else {}
              });
            },
            padding: EdgeInsets.zero,
            child: widget.content['lock'][index] == true
                ? Container(
                    alignment: Alignment.center,
                    width: 104,
                    height: 104,
                    decoration: BoxDecoration(
                        color: _colors.drawerColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Image.asset(_assets.lock),
                  )
                : Container(
                    alignment: Alignment.center,
                    width: 104,
                    height: 100,
                    decoration: BoxDecoration(
                        color: widget.content['colors'][index],
                        borderRadius: BorderRadius.circular(35)),
                    child: SvgBuilder(
                      path: widget.content['icons'][index],
                      width: 55,
                      height: 55,
                    )),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 35,
            crossAxisSpacing: 0,
            mainAxisExtent: 100));
  }
}
