import 'package:flutter/material.dart';
import 'package:mind_games/presentation/resources/assets.dart';

ImageAssets _assets = ImageAssets();

class MyCustomNumber extends StatelessWidget {
  final String num;
  final double size;
  final Color  color;
  final List<String> allNumbers = [];
  MyCustomNumber({super.key, required this.num, required this.color, required this.size});

  final Map map = {
    '0': _assets.num_0,
    '1': _assets.num_1,
    '2': _assets.num_2,
    '3': _assets.num_3,
    '4': _assets.num_4,
    '5': _assets.num_5,
    '6': _assets.num_6,
    '7': _assets.num_7,
    '8': _assets.num_8,
    '9': _assets.num_9,
  };

  @override
  Widget build(BuildContext context) {
    for (var i in num.characters) {
      allNumbers.add(i);
    }
    return ListView.builder(

      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      itemCount: allNumbers.length,
      itemBuilder: (context, index) =>
          Image.asset(
            map[allNumbers[index]],
            color: color,
            width: 5,
            fit: BoxFit.fitWidth,
          ),
    );
  }
}
