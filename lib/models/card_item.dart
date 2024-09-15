import 'package:flutter/material.dart';
import 'package:mind_games/presentation/resources/assets.dart';
import 'package:mind_games/presentation/resources/colors.dart';

enum CardState { hidden, visible, guessed }

class CardItem {
  final AppColors _colors = AppColors();
  final ImageAssets _assets = ImageAssets();

  final int value;
  CardState state;

  CardItem(this.value, {this.state = CardState.hidden});

  String get icon {
    switch (value) {
      case 1:
        return _assets.spiderMan;
      case 2:
        return _assets.superMan;
      case 3:
        return _assets.batMan;
      case 4:
        return _assets.owl;
      case 5:
        return _assets.butterfly;
      case 6:
        return _assets.dolphin;
      default:
        return _assets.playing;
    }
  }

  Color get color {
    switch (value) {
      case 1:
        return _colors.cardColor;
      case 2:
        return _colors.cardColor;
      case 3:
        return _colors.cardColor;
      case 4:
        return _colors.cardColor;
      case 5:
        return _colors.cardColor;
      case 6:
        return _colors.cardColor;
      case 7:
        return _colors.cardColor;
      case 8:
        return _colors.cardColor;
      default:
        return Colors.black;
    }
  }
}
