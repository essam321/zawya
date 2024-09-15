import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mind_games/presentation/common/custom_clipper.dart';
import 'package:mind_games/presentation/common/custom_text.dart';
import 'package:mind_games/presentation/drawer/custom_drawer.dart';
import 'package:mind_games/presentation/follow_up/followup_list_view.dart';
import 'package:mind_games/presentation/resources/colors.dart';
import 'package:mind_games/presentation/resources/font.dart';

class FollowUp extends StatefulWidget {
  final String mainLabel;
  final Map content;

  const FollowUp({super.key, required this.mainLabel, required this.content});

  @override
  State<FollowUp> createState() => _FollowUpState();
}

class _FollowUpState extends State<FollowUp> {
  final AppColors _colors = AppColors();
  final AppFonts _fonts = AppFonts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _colors.primaryColor,
      appBar: AppBar(
        //  toolbarHeight: 30,
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
                    ],
                  ),
                ),
              ),
            ),
            // games menu builder
            FollowUpListView(
              content: widget.content,
            ),
          ],
        ),
      ),
    );
  }
}
