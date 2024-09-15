import 'package:flutter/material.dart';
import 'package:mind_games/presentation/common/custom_text.dart';
import 'package:mind_games/presentation/common/onboarding_body.dart';
import 'package:mind_games/presentation/login/sign_in/sign_in.dart';
import 'package:mind_games/presentation/resources/assets.dart';
import 'package:mind_games/presentation/resources/colors.dart';
import 'package:mind_games/presentation/resources/strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final AppColors _appColors = AppColors();
  final ImageAssets _assets = ImageAssets();
  final PageController _controller = PageController();
  final AppStrings _strings = AppStrings();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              OnboardingBody(
                  color: Colors.white,
                  image: _assets.board_1,
                  t1: _strings.onboarding_1_T1,
                  t2: _strings.onboarding_1_T2),
              OnboardingBody(
                  color: Colors.white,
                  image: _assets.board_2,
                  t1: _strings.onboarding_2_T1,
                  t2: _strings.onboarding_2_T2),
              OnboardingBody(
                  color: Colors.white,
                  image: _assets.board_3,
                  t1: _strings.onboarding_3_T1,
                  t2: _strings.onboarding_3_T2),
            ],
          ),
          Container(
              alignment: const Alignment(.85,-.9),
              child: TextButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
              }, child: CustomText(data:_strings.skipButton ,color: const Color.fromRGBO(25, 81, 107, 0.52),size: 16,))),
          Container(
              alignment: const Alignment(0, 0.9),
              child: SmoothPageIndicator(
                effect: WormEffect(
                    activeDotColor: _appColors.h1Text,
                    dotHeight: 15,
                    dotWidth: 15,
                    dotColor: Colors.grey.shade300),
                controller: _controller,
                count: 3,
              ))
        ],
      ),
    );
  }
}

