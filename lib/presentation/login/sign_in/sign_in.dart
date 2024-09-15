import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mind_games/presentation/common/custom_button.dart';
import 'package:mind_games/presentation/common/custom_text.dart';
import 'package:mind_games/presentation/common/custom_text_form.dart';
import 'package:mind_games/presentation/login/forget_password/forget_password.dart';
import 'package:mind_games/presentation/login/sign_up/sign_up.dart';
import 'package:mind_games/presentation/main_menu/main_menu.dart';
import 'package:mind_games/presentation/resources/assets.dart';
import 'package:mind_games/presentation/resources/colors.dart';
import 'package:mind_games/presentation/resources/objects.dart';
import 'package:mind_games/presentation/resources/strings.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final AppColors _colors = AppColors();
  final AppStrings _strings = AppStrings();
  final ImageAssets _assets = ImageAssets();
  final GamesObjects _objects = GamesObjects();

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: _colors.primaryColor,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(h/20),
            child: Image.asset(_assets.logo, height:h/4),
          ),
          Column(
            children: [
              CustomTextForm(
                height: h,
                textInputType: TextInputType.emailAddress,
                hintText: _strings.email,
                suffixIcon: Icon(Icons.email, color: _colors.grayColor),
              ),
              CustomTextForm(
                height: h,
                obscureText: true,
                textInputType: TextInputType.visiblePassword,


                hintText: _strings.password,
                suffixIcon: Icon(Icons.lock, color: _colors.grayColor),
              ),
              InkWell(
                onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgetPasswordScreen(),
                    )),
                child: Container(
                  padding: const EdgeInsets.only(right: 30, top: 5, bottom: 30),
                  width: double.infinity,
                  child: CustomText(
                    data: _strings.forgetPassword,
                    color: Colors.grey,
                    size: 10,
                  ),
                ),
              ),
              //Login button
            ],
          ),
          Column(
            children: [
              CustomButton(
                text: CustomText(
                  data: _strings.login,
                  color: Colors.white,
                  size: 25,
                  fontWeight: 7,
                ),
                fun: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScreen(
                          circleIcon: false,
                            mainLabel: _strings.games,
                            mainIcon: _assets.gameController,
                            content: _objects.allChoices[_strings.mainMenu]),
                      ));
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ));
                    },
                    child: CustomText(
                        data: _strings.createAccount,
                        color: Colors.blue,
                        size: 14),
                  ),
                  CustomText(
                    data: _strings.dontHaveAccount,
                    color: Colors.grey,
                    size: 14,
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: h/20),
            child: Column(
              children: [
                CustomText(
                    fontWeight: 7,
                    size: 16,
                    data: _strings.createAccountBy,
                    color: const Color.fromRGBO(0, 0, 0, 0.16)),
                 SizedBox(
                                 ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.instagram,
                        color: Colors.red, size: 33),
                    SizedBox(
                      width: 25,
                    ),
                    FaIcon(FontAwesomeIcons.facebook,
                        color: Colors.indigo, size: 33),
                    SizedBox(
                      width: 25,
                    ),
                    FaIcon(FontAwesomeIcons.googlePlus,
                        color: Colors.red, size: 33),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
