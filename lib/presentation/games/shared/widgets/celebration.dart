import 'package:flutter/material.dart';
import 'package:mind_games/presentation/resources/assets.dart';



class Celebration extends StatelessWidget {
  Celebration(this.width, {super.key});
  final ImageAssets _assets=ImageAssets();
  final double width;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          _assets.celebration,
          fit: BoxFit.fitWidth,
          width: width,
        ),
        Image.asset(
          _assets.celebration,
          fit: BoxFit.fitWidth,
          width: width,
        ),
      ],
    );
  }
}
