import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mind_games/custom_icons_icons.dart';
import 'package:mind_games/presentation/common/custom_dialog.dart';
import 'package:mind_games/presentation/common/custom_text.dart';
import 'package:mind_games/presentation/follow_up/follow_up.dart';
import 'package:mind_games/presentation/resources/assets.dart';
import 'package:mind_games/presentation/resources/objects.dart';
import 'package:mind_games/presentation/resources/strings.dart';
import 'package:mind_games/presentation/login/sign_up/avatar_choise.dart';


ImageAssets _assets = ImageAssets();
AppStrings _strings = AppStrings();
GamesObjects _objects=GamesObjects();

class DrawerListView extends StatelessWidget {
  DrawerListView({super.key});

  final List drawerIcons = [
    const FaIcon(FontAwesomeIcons.gamepad, color: Colors.white),
    const FaIcon(FontAwesomeIcons.addressBook, color: Colors.white),
    Image.asset(_assets.family, color: Colors.white),
    const Icon(CustomIcons.book, color: Colors.white),
    const Icon(CustomIcons.share, color: Colors.white),
    const FaIcon(FontAwesomeIcons.star, color: Colors.white),
    const FaIcon(FontAwesomeIcons.headset, color: Colors.white),
    const FaIcon(FontAwesomeIcons.message, color: Colors.white),
    const FaIcon(FontAwesomeIcons.gear, color: Colors.white),
    const FaIcon(FontAwesomeIcons.doorOpen, color: Colors.white),
  ];
  final List drawerStrings = [
    _strings.games,
    _strings.personalProfile,
    _strings.followUp,
    _strings.externalBook,
    _strings.shareApp,
    _strings.rateUs,
    _strings.helpAndSecurity,
    _strings.talkWithUs,
    _strings.setting,
    _strings.logOut,
  ];

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: ListView.builder(
        itemCount: drawerStrings.length,
        itemBuilder: (context, index) => Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () {

                  switch(index){
                    case 2:
                      Scaffold.of(context).closeDrawer();
                      Navigator.push(context,MaterialPageRoute(builder: (context) => FollowUp(mainLabel: _strings.levels, content: _objects.followUp[_strings.levels]),));
                      
                    case 8:
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AvatarChoise(),));
                    case 9:
                      Scaffold.of(context).closeDrawer();
                      showDialog(
                          context: context,
                          builder: (context) => CustomDialogWidget());
                      
                  }

                },
                child: CustomText(
                    data: drawerStrings[index],
                    color: Colors.white,
                    fontWeight: 7,
                    size: 20)),
            const SizedBox(width: 25),
            drawerIcons[index],
          ],
        ),
      ),
    );
  }
}
