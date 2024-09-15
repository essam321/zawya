import 'package:flutter/material.dart';
import 'package:mind_games/presentation/common/custom_button.dart';
import 'package:mind_games/presentation/common/custom_text.dart';
import 'package:mind_games/presentation/common/custom_text_form.dart';
import 'package:mind_games/presentation/login/sign_in/sign_in.dart';
import 'package:mind_games/presentation/resources/assets.dart';
import 'package:mind_games/presentation/resources/colors.dart';
import 'package:mind_games/presentation/resources/strings.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final AppColors _colors = AppColors();
  final AppStrings _strings = AppStrings();
  final ImageAssets _assets = ImageAssets();

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: _colors.primaryColor,
      body: ListView(
        children: [
          Image.asset(_assets.logo,),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: CustomTextForm(
              height: h,
                hintText: _strings.email, suffixIcon: Icon(Icons.email,color: _colors.grayColor,)),
          ),
          Column(
            children: [
              CustomButton(
                  fun: () {

                  },
                  text: CustomText(
                    data: _strings.send,
                    color: Colors.white,
                    size: 25,
                    fontWeight: 7,
                  )), Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          )),
                      child: CustomText(data: _strings.login, color: Colors.blue, size: 14)),
                  CustomText(
                    data: _strings.remember,
                    color: Colors.grey,
                    size: 14,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox()

        ],
      ),
    );
  }
}
