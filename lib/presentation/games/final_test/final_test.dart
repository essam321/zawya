import 'package:flutter/material.dart';
import 'package:mind_games/presentation/games/comparison/compriosn_screen.dart';
import 'package:mind_games/presentation/games/lets_count/lets_count_screen.dart';
import 'package:mind_games/presentation/games/lets_order/lets_order_screen.dart';
import 'package:mind_games/presentation/games/math/math_screen.dart';
import 'package:mind_games/presentation/games/memory/memory_screen.dart';
import 'package:mind_games/presentation/games/selection/choise_screen.dart';
import 'package:mind_games/presentation/resources/objects.dart';

GamesObjects _gamesObjects = GamesObjects();

Widget finalTest(nav) {
  switch (nav) {
    case 'finalMathPlus':
      return MathScreen(content: _gamesObjects.finalTest['finalMathPlus']);
    case 'finalSun':
      return SelectionScreen(
        content: _gamesObjects.finalTest['finalSun'],
        kind: WhatShape.objects,
      );
    case 'finalMathMinus':
      return MathScreen(
        content: _gamesObjects.finalTest['finalMathMinus'],
      );
    case 'finalLetsCount':
      return LetsCountScreen(
        content: _gamesObjects.finalTest['finalLetsCount'],
      );
    case 'finalEqual':
      return ComparisonScreen(
        content: _gamesObjects.finalTest['finalEqual'],
      );
    case 'finalCircle':
      return SelectionScreen(
        content: _gamesObjects.finalTest['finalCircle'],
        kind: WhatShape.shapes,
      );

    case 'finalLetsOrder':
      return LetsOrderScreen(
        content: _gamesObjects.finalTest['finalLetsOrder'],
      );
    case 'finalComparison':
      return ComparisonScreen(
        content: _gamesObjects.finalTest['finalComparison'],
      );
    case 'finalCrab':
      return SelectionScreen(
        content: _gamesObjects.finalTest['finalCrab'],
        kind: WhatShape.colors,
      );
    case 'finalMemory':
      return MemoryScreen(
        index: 3,
      );
    default:
      return Container();
  }
}
