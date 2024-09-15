import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:mind_games/presentation/common/custom_button.dart';
import 'package:mind_games/presentation/common/custom_text.dart';
import 'package:mind_games/presentation/common/custom_text_form.dart';
import 'package:mind_games/presentation/resources/assets.dart';
import 'package:mind_games/presentation/resources/colors.dart';
import 'package:mind_games/presentation/resources/font.dart';
import 'package:mind_games/presentation/resources/strings.dart';

AppColors _colors = AppColors();

AppStrings _strings = AppStrings();

ImageAssets _assets = ImageAssets();
AppFonts _fonts = AppFonts();

class AvatarChoise extends StatefulWidget {
  const AvatarChoise({super.key});

  @override
  State<AvatarChoise> createState() => _AvatarChoiseState();
}

class _AvatarChoiseState extends State<AvatarChoise> {
  final GroupButtonController _controller = GroupButtonController();

  List avatars = [
    Image.asset(_assets.person_1),
    Image.asset(_assets.person_2),
    Image.asset(_assets.person_3),
    Image.asset(_assets.person_4),
    Image.asset(_assets.person_5),
    Image.asset(_assets.person_6),
    Image.asset(_assets.person_7),
    Image.asset(_assets.person_8),
    Image.asset(_assets.person_9),
    Image.asset(_assets.person_10),
    Image.asset(_assets.person_11),
    Image.asset(_assets.person_12),
  ];
  List avatarsColors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: _colors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),
          CustomTextForm(
            height: h,
            enabled: false,
              hintText: 'سارة',
              suffixIcon: Icon(
                Icons.edit,
                color: _colors.grayColor,
              )),
          const Spacer(
            flex: 1,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomText(
                data: _strings.pickPicture,
                color: const Color.fromRGBO(188, 81, 55, 1),
                size: 20,
                fontWeight: 7,
                font: _fonts.Tajawal_Bold,
              ),
              buildAvatars(),
            ],
          ),
          const Spacer(flex: 1),
          CustomButton(fun: () {

          }, text:CustomText(data: _strings.start,color: Colors.white,fontWeight: 7,size: 23,)),
          const Spacer(
            flex: 3,
          ),

        ],
      ),
    );
  }

  Container buildAvatars() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30)),
              child: GroupButton(
                controller: _controller,
                isRadio: true,
                onSelected: (value, index, isSelected) {},
                buttonIndexedBuilder: (selected, index, context) {
                  return MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        avatarsColors = [
                          Colors.white,
                          Colors.white,
                          Colors.white,
                          Colors.white,
                          Colors.white,
                          Colors.white,
                          Colors.white,
                          Colors.white,
                          Colors.white,
                          Colors.white,
                          Colors.white,
                          Colors.white,
                        ];

                        avatarsColors[index] = _colors.buttonColor;
                      });
                    },
                    padding: const EdgeInsets.all(1),
                    shape: const CircleBorder(),
                    child: Container(
                      margin: EdgeInsets.zero,
                      padding: const EdgeInsets.all(5),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: avatarsColors[index],
                          shape: BoxShape.circle),
                      child: avatars[index],
                    ),
                  );
                },
                buttons: [
                  _assets.person_1,
                  _assets.person_2,
                  _assets.person_3,
                  _assets.person_4,
                  _assets.person_5,
                  _assets.person_6,
                  _assets.person_7,
                  _assets.person_8,
                  _assets.person_9,
                  _assets.person_10,
                  _assets.person_11,
                  _assets.person_12,
                ],
              ),
            );
  }
}
