import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mind_games/presentation/common/custom_button.dart';
import 'package:mind_games/presentation/common/custom_text.dart';
import 'package:mind_games/presentation/common/custom_text_form.dart';
import 'package:mind_games/presentation/login/sign_in/sign_in.dart';
import 'package:mind_games/presentation/login/sign_up/avatar_choise.dart';
import 'package:mind_games/presentation/login/sign_up/custom_radio.dart';
import 'package:mind_games/presentation/resources/colors.dart';
import 'package:mind_games/presentation/resources/strings.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key}) {
    // TODO: implement SignUpScreen
  }

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AppColors _colors = AppColors();

  final AppStrings _strings = AppStrings();

  String? gender;

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: _colors.primaryColor,
      body: ListView(
        padding: const EdgeInsets.only(top: 100),
        children: [
          CustomTextForm(
            height: h,
              hintText: _strings.name,
              suffixIcon: Icon(
                Icons.person,
                color: _colors.grayColor,
              )),
          CustomTextForm(
            height: h,
              textInputType: TextInputType.number,
              hintText: _strings.phoneNumber,
              suffixIcon: Icon(
                Icons.phone_enabled_rounded,
                color: _colors.grayColor,
              )),
          CustomTextForm(
            height: h,
              textInputType: TextInputType.emailAddress,
              hintText: _strings.email,
              suffixIcon: Icon(
                Icons.email,
                color: _colors.grayColor,
              )),
          CustomTextForm(
            height: h,
              obscureText: true,
              hintText: _strings.password,
              suffixIcon: Icon(
                Icons.lock,
                color: _colors.grayColor,
              )),
          const SizedBox(
            height: 20,
          ),
          const CustomRadioButtons(),
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              CustomButton(
                text: CustomText(
                  data: _strings.createAccount,
                  color: Colors.white,
                  size: 25,
                  fontWeight: 7,
                ),
                fun: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AvatarChoise(),
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
                            builder: (context) => SignInScreen(),
                          ));
                    },
                    child: CustomText(
                        data: _strings.login, color: Colors.blue, size: 14),
                  ),
                  CustomText(
                    data: _strings.haveAccount,
                    color: Colors.grey,
                    size: 14,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Column(
              children: [
                CustomText(
                    fontWeight: 7,
                    size: 16,
                    data: _strings.createAccountBy,
                    color: const Color.fromRGBO(0, 0, 0, 0.16)),
                const SizedBox(
                  height: 25,
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
