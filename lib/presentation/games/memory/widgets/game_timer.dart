import 'package:flutter/material.dart';
import 'package:mind_games/presentation/resources/colors.dart';

class GameTimer extends StatelessWidget {
  final int time;

  GameTimer({super.key, required this.time});

  final AppColors _colors = AppColors();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.access_time_filled_outlined,
          color: _colors.cardColor,
          size: 40,
        ),
        Center(
          child: Text('$time \'s'),
        )
      ],
    );
  }
}
