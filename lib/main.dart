import 'package:flutter/material.dart';
import 'package:mind_games/presentation/splash/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    // TODO: implement MyApp
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
