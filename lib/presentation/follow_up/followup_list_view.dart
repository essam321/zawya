import 'package:flutter/material.dart';
import 'package:mind_games/presentation/common/custom_text.dart';
import 'package:mind_games/presentation/follow_up/follow_up.dart';
import 'package:mind_games/presentation/resources/colors.dart';
import 'package:mind_games/presentation/resources/font.dart';
import 'package:mind_games/presentation/resources/objects.dart';

AppColors _colors = AppColors();
AppFonts _fonts = AppFonts();

class FollowUpListView extends StatefulWidget {
  final Map content;

  const FollowUpListView({super.key, required this.content});

  @override
  State<FollowUpListView> createState() => _FollowUpListViewState();
}

class _FollowUpListViewState extends State<FollowUpListView> {

  final GamesObjects _gamesObjects = GamesObjects();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Expanded(
      child: Padding(
          padding: widget.content['length'] == 9
              ? EdgeInsets.symmetric(vertical: height / 10)
              : EdgeInsets.zero,

          // if condition to differentiate between normal list builder and result grid
          child: widget.content['length']==4 ? resultGrid(): normalListView(height) ),
    );
  }

  Widget normalListView(double height) {
    return ListView.builder(
      itemCount: widget.content['length'],
      itemBuilder: (context, index) {
        return MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          onPressed: () {
            setState(() {
              if (widget.content['lock'][index] == false ) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FollowUp(
                          mainLabel: widget.content['text'][index],
                          content: _gamesObjects.followUp[widget.content['text'][index]]),
                    ));
              }
            });
          },
          padding: EdgeInsets.zero,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            width: 350,
            height: index == 0
                ? (height / 1.4) / widget.content['length']
                : (height / 1.6) / widget.content['length'],
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(index == 0 ? 15 : 40)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 46,
                  width: 46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(index == 0 ? 9 : 50),
                    color: _colors.darkPrimaryColor,
                  ),
                  child: Image.asset(widget.content['score'][index]),
                ),
                CustomText(
                  font: _fonts.Tajawal_Bold,
                  data: widget.content['text'][index],
                  color: _colors.textColor,
                  size: index == 0 ? 20 : 14,
                  fontWeight: 7,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget resultGrid() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              resultBox(widget.content['score'][0], topLeft: const Radius.circular(20)),
              resultBox(widget.content['score'][1]),
              resultBox(widget.content['score'][2]),
              resultBox(widget.content['score'][3], bottomLeft: const Radius.circular(20)),
            ],
          ),
          const SizedBox(width: 1),
          Column(
            children: [
              resultBox(widget.content['text'][0], topRight: const Radius.circular(20)),
              resultBox(widget.content['text'][1]),
              resultBox(widget.content['text'][2]),
              resultBox(widget.content['text'][3], bottomRight: const Radius.circular(20)),
            ],
          ),
        ],
      ),
    );
  }

  Widget resultBox(
    String text, {
    Radius bottomLeft = const Radius.circular(0),
    Radius bottomRight = const Radius.circular(0),
    Radius topLeft = const Radius.circular(0),
    Radius topRight = const Radius.circular(0),
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.all(0.5),
      width: 160,
      height: 85,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: bottomLeft,
              bottomRight: bottomRight,
              topLeft: topLeft,
              topRight: topRight)),
      child: CustomText(
        font: _fonts.Tajawal_Bold,
        data: text,
        color: _colors.textColor,
        size: 14,
        fontWeight: 7,
      ),
    );
  }
}
