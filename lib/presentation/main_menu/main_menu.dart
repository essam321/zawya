import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mind_games/data/sharedPref/app_prefs.dart';
import 'package:mind_games/presentation/common/custom_clipper.dart';
import 'package:mind_games/presentation/common/custom_text.dart';
import 'package:mind_games/presentation/drawer/custom_drawer.dart';
import 'package:mind_games/presentation/main_menu/games_list_view.dart';
import 'package:mind_games/presentation/resources/colors.dart';
import 'package:mind_games/presentation/resources/font.dart';
import 'package:mind_games/presentation/resources/strings.dart';

class MainScreen extends StatefulWidget {
  final String mainLabel;
  final String mainIcon;
  final bool circleIcon;
  final Map content;

  const MainScreen(
      {super.key,
      required this.circleIcon,
      required this.mainLabel,
      required this.mainIcon,
      required this.content});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final AppStrings _strings = AppStrings();
  final AppColors _colors = AppColors();
  final AppFonts _fonts = AppFonts();
  final AppPrefs _prefs = AppPrefs();

  List lock = [];

  @override
  void initState() {
    state();
    super.initState();
  }

  void state() async {
    if (widget.mainLabel == _strings.numbers) {
      for (int i = 0; i <= widget.content['length'] -1; i++) {
        String x = widget.content['text'][i];
        print(x);
        bool game = await _prefs.loadGameState(gameName: x);
        print(game);
        lock.add(game);
        widget.content['lock'][i] = game;
      }
      widget.content['lock'][2] = false;

    } else {
      lock.add(false);
      for (int i = 1; i <= widget.content['length'] - 1; i++) {
        String x = widget.content['text'][i];
        bool game = await _prefs.loadGameState(gameName: x);
        lock.add(game);
        widget.content['lock'][i] = game;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _colors.primaryColor,
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            icon: FaIcon(FontAwesomeIcons.bars,
                color: _colors.buttonColor, size: 25),
            onPressed: () {
              setState(() {
                Scaffold.of(context).openDrawer();
              });
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: const CustomDrawer(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CustomPaint(
                size: const Size(296, 59),
                painter: SideCutContainer(),
                child: SizedBox(
                  width: 300,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        font: _fonts.Tajawal_Bold,
                        data: widget.mainLabel,
                        color: Colors.white,
                        size: 25,
                        fontWeight: 7,
                      ),
                      const SizedBox(width: 15),
                      !widget.circleIcon
                          ? Image.asset(widget.mainIcon)
                          : Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: Image.asset(
                                widget.mainIcon,
                                width: 25,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
            // games menu builder
            lock.length > 1
                ? GamesListView(
                    content: widget.content,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
