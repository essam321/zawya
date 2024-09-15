import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:mind_games/presentation/onboarding/onboarding.dart';

import '../resources/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  AppColors appColors=AppColors();


  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash:'assets/img/splash.png' , nextScreen: const OnboardingScreen(),

    backgroundColor:appColors.primaryColor ,);
  }
}
