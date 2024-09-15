import 'package:flutter/material.dart';
import 'package:mind_games/presentation/games/comparison/compriosn_screen.dart';
import 'package:mind_games/presentation/games/lets_count/lets_count_screen.dart';
import 'package:mind_games/presentation/games/lets_order/lets_order_screen.dart';
import 'package:mind_games/presentation/games/math/math_screen.dart';
import 'package:mind_games/presentation/games/memory/memory_screen.dart';
import 'package:mind_games/presentation/games/selection/choise_screen.dart';
import 'package:mind_games/presentation/resources/assets.dart';
import 'package:mind_games/presentation/resources/colors.dart';
import 'package:mind_games/presentation/resources/strings.dart';

ImageAssets _assets = ImageAssets();
AppStrings _strings = AppStrings();
AppColors _colors = AppColors();
GamesObjects _gamesObjects = GamesObjects();

enum WhatShape { colors, shapes, objects }

class GamesObjects {
  Map allChoices = {
    _strings.mainMenu: {
      'length': 7,
      'nav': [
        _strings.letsPlay,
        _strings.numbers,
        _strings.letsCount,
        _strings.letsOrder,
        _strings.bigAndSmall,
        _strings.plusAndMinus,
        _strings.finalTest,
      ],
      'icons': [
        _assets.playing,
        _assets.numberBlocks,
        _assets.growth1,
        _assets.growth2,
        _assets.bottles,
        _assets.math,
        _assets.exam,
      ],
      'text': [
        _strings.letsPlay,
        _strings.numbers,
        _strings.letsCount,
        _strings.letsOrder,
        _strings.bigAndSmall,
        _strings.plusAndMinus,
        _strings.finalTest,
      ],
      'lock': [
        false,
        false,
        false,
        false,
        false,
        false,
        false,
      ]
    },
    _strings.letsPlay: {
      'length': 4,
      'nav': [
        _strings.frog,
        _strings.shapes,
        _strings.relations,
        _strings.superHeroes,
      ],
      'icons': [
        _assets.paintPalette,
        _assets.shapes,
        _assets.cats,
        _assets.cardGames,
      ],
      'text': [
        _strings.colors,
        _strings.shapes,
        _strings.relations,
        _strings.cards,
      ],
      'lock': [
        false,
        true,
        true,
        true,
      ]
    },
    _strings.numbers: {
      'length': 9,
      'nav': [
        '3',
        '2',
        '1',
        '6',
        '5',
        '4',
        '9',
        '8',
        '7',
      ],
      'icons': [
        _assets.num_3,
        _assets.num_2,
        _assets.num_1,
        _assets.num_6,
        _assets.num_5,
        _assets.num_4,
        _assets.num_9,
        _assets.num_8,
        _assets.num_7,
      ],
      'text': [
        '3',
        '2',
        '1',
        '6',
        '5',
        '4',
        '9',
        '8',
        '7',
      ],
      'lock': [
        false,
        false,
        false,
        false,
        false,
        true,
        true,
        true,
        true,
      ],
      'colors': [
        const Color.fromRGBO(179, 187, 255, 1),
        const Color.fromRGBO(113, 208, 134, 1),
        const Color.fromRGBO(255, 179, 216, 1),
        const Color.fromRGBO(235, 191, 255, 1),
        const Color.fromRGBO(138, 157, 255, 1),
        const Color.fromRGBO(114, 228, 228, 1),
        const Color.fromRGBO(242, 135, 167, 1),
        const Color.fromRGBO(255, 227, 129, 1),
        const Color.fromRGBO(241, 164, 228, 1),
      ],
    },
    _strings.letsOrder: {
      'nav': [_strings.progressive, _strings.descending],
      'length': 2,
      'icons': [
        _assets.upStairs,
        _assets.downStairs,
      ],
      'text': [
        _strings.progressive,
        _strings.descending,
      ],
      'lock': [
        false,
        true,
      ],
    },
    _strings.plusAndMinus: {
      'length': 2,
      'nav': [
        _strings.plus,
        _strings.minus,
      ],
      'icons': [
        _assets.plus,
        _assets.minus,
      ],
      'text': [
        _strings.plus,
        _strings.minus,
      ],
      'lock': [
        false,
        true,
      ],
    },
  };
  Map followUp = {
    _strings.levels: {
      'length': 8,
      'icons': [
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
      ],
      'text': [
        _strings.totalDegrees,
        _strings.audioVisualSkills,
        _strings.knowsNumbers,
        _strings.knowsCount,
        _strings.numbersOrdering,
        _strings.numbersComparison,
        _strings.additionSubtraction,
        _strings.finalQuiz,
      ],
      'lock': [
        true,
        false,
        false,
        false,
        false,
        false,
        false,
        true,
      ],
      'score': [
        _assets.num_100,
        _assets.num_10,
        _assets.num_10,
        _assets.num_10,
        _assets.num_10,
        _assets.num_10,
        _assets.num_10,
        _assets.num_40,
      ]
    },
    _strings.knowsNumbers: {
      'length': 4,
      'icons': ['', '', '', ''],
      'text': [
        _strings.numberOfAttempts,
        _strings.numberOfDays,
        _strings.timeOfDay,
        _strings.accuracy,
      ],
      'lock': [
        false,
        false,
        false,
        false,
      ],
      'score': [
        '',
        '',
        '',
        '',
      ]
    },
    _strings.audioVisualSkills: {
      'length': 4,
      'icons': ['', '', '', ''],
      'text': [
        _strings.numberOfAttempts,
        _strings.numberOfDays,
        _strings.timeOfDay,
        _strings.accuracy,
      ],
      'lock': [
        false,
        false,
        false,
        false,
      ],
      'score': [
        '',
        '',
        '',
        '',
      ]
    },
    _strings.knowsCount: {
      'length': 4,
      'icons': ['', '', '', ''],
      'text': [
        _strings.numberOfAttempts,
        _strings.numberOfDays,
        _strings.timeOfDay,
        _strings.accuracy,
      ],
      'lock': [
        false,
        false,
        false,
        false,
      ],
      'score': [
        '',
        '',
        '',
        '',
      ]
    },
    _strings.numbersOrdering: {
      'length': 4,
      'icons': ['', '', '', ''],
      'text': [
        _strings.numberOfAttempts,
        _strings.numberOfDays,
        _strings.timeOfDay,
        _strings.accuracy,
      ],
      'lock': [
        false,
        false,
        false,
        false,
      ],
      'score': [
        '',
        '',
        '',
        '',
      ]
    },
    _strings.numbersComparison: {
      'length': 4,
      'icons': ['', '', '', ''],
      'text': [
        _strings.numberOfAttempts,
        _strings.numberOfDays,
        _strings.timeOfDay,
        _strings.accuracy,
      ],
      'lock': [
        false,
        false,
        false,
        false,
      ],
      'score': [
        '',
        '',
        '',
        '',
      ]
    },
    _strings.additionSubtraction: {
      'length': 4,
      'icons': ['', '', '', ''],
      'text': [
        _strings.numberOfAttempts,
        _strings.numberOfDays,
        _strings.timeOfDay,
        _strings.accuracy,
      ],
      'lock': [
        false,
        false,
        false,
        false,
      ],
      'score': [
        '',
        '',
        '',
        '',
      ]
    },
  };
  Map selection = {
    _strings.frog: {
      'nav': _strings.finishColors,
      'length': 3,
      'icons': [_assets.frogCry, _assets.frog],
      'choices': [_colors.red, _colors.green, _colors.yellow],
      'answer': _colors.green,
      'gradient': [
        _colors.darkPurple,
        _colors.lightPurple,
      ],
    },
    _strings.triangle: {
      'nav': _strings.circle,
      'length': 3,
      'icons': [_assets.triangle, _assets.triangle_1],
      'choices': [_assets.triangle_1, _assets.circle_1, _assets.square_1],
      'answer': _assets.triangle_1,
      'gradient': [
        _colors.darkBlue,
        _colors.lightBlue,
      ],
    },
    _strings.square: {
      'nav': _strings.relations,
      'length': 3,
      'icons': [_assets.square, _assets.square_1],
      'choices': [_assets.triangle_1, _assets.circle_1, _assets.square_1],
      'answer': _assets.square_1,
      'gradient': [
        _colors.darkBlue,
        _colors.lightBlue,
      ],
    },
    _strings.circle: {
      'nav': _strings.square,
      'length': 3,
      'icons': [_assets.circle, _assets.circle_1],
      'choices': [_assets.triangle_1, _assets.circle_1, _assets.square_1],
      'answer': _assets.circle_1,
      'gradient': [
        _colors.darkBlue,
        _colors.lightBlue,
      ],
    },
    _strings.book: {
      'nav': _strings.tree,
      'length': 3,
      'icons': [_assets.book, _assets.book],
      'choices': [_assets.earth, _assets.leaf, _assets.pen],
      'answer': _assets.pen,
      'gradient': [
        const Color.fromRGBO(195, 118, 255, 1),
        const Color.fromRGBO(222, 194, 255, 1),
      ],
    },
    _strings.tree: {
      'nav': _strings.sun,
      'length': 3,
      'icons': [_assets.tree, _assets.tree],
      'choices': [_assets.earth, _assets.leaf, _assets.pen],
      'answer': _assets.leaf,
      'gradient': [
        const Color.fromRGBO(195, 118, 255, 1),
        const Color.fromRGBO(222, 194, 255, 1),
      ],
    },
    _strings.sun: {
      'nav': _strings.cards,
      'length': 3,
      'icons': [_assets.sun, _assets.sun],
      'choices': [_assets.earth, _assets.leaf, _assets.pen],
      'answer': _assets.earth,
      'gradient': [
        const Color.fromRGBO(195, 118, 255, 1),
        const Color.fromRGBO(222, 194, 255, 1),
      ],
    },
  };
  Map letsCount = {
    '1': {
      'color': _colors.selectedRose,
      'nav': '2',
      'length': 1,
      'icons': [_assets.cow, _assets.cow],
      'choices': [_assets.num_1, _assets.num_2, _assets.num_3],
      'answer': _assets.num_1,
      'gradient': [
        _colors.darkRose,
        _colors.lightRose,
      ],
    },
    '2': {
      'color': _colors.selectedBlue,
      'nav': '3',
      'length': 2,
      'icons': [_assets.duck, _assets.duck],
      'choices': [_assets.num_1, _assets.num_2, _assets.num_3],
      'answer': _assets.num_2,
      'gradient': [
        _colors.darkBlue,
        _colors.lightBlue,
      ],
    },
    '3': {
      'color': _colors.selectedGreen,
      'nav': '4',
      'length': 3,
      'icons': [_assets.apple, _assets.apple],
      'choices': [_assets.num_1, _assets.num_2, _assets.num_3],
      'answer': _assets.num_3,
      'gradient': [
        _colors.darkGreen,
        _colors.lightGreen,
      ],
    },
    '4': {
      'color': _colors.selectedPurple,
      'nav': '5',
      'length': 4,
      'icons': [_assets.banana, _assets.banana],
      'choices': [_assets.num_4, _assets.num_6, _assets.num_5],
      'answer': _assets.num_4,
      'gradient': [
        _colors.darkPurple,
        _colors.lightPurple,
      ],
    },
    '5': {
      'color': _colors.selectedBlue,
      'nav': '6',
      'length': 5,
      'icons': [_assets.strawberry, _assets.strawberry],
      'choices': [_assets.num_4, _assets.num_6, _assets.num_5],
      'answer': _assets.num_5,
      'gradient': [
        _colors.darkBlue,
        _colors.lightBlue,
      ],
    },
    '6': {
      'color': _colors.selectedPurple,
      'nav': '7',
      'length': 6,
      'icons': [_assets.orange, _assets.orange],
      'choices': [_assets.num_4, _assets.num_6, _assets.num_5],
      'answer': _assets.num_6,
      'gradient': [
        _colors.darkPurple,
        _colors.lightPurple,
      ],
    },
    '7': {
      'color': _colors.selectedNavyBlue,
      'nav': '8',
      'length': 7,
      'icons': [_assets.watermelon, _assets.watermelon],
      'choices': [_assets.num_7, _assets.num_8, _assets.num_9],
      'answer': _assets.num_7,
      'gradient': [
        _colors.darkNavyBlue,
        _colors.lightNavyBlue,
      ],
    },
    '8': {
      'color': _colors.selectedYellow,
      'nav': '9',
      'length': 8,
      'icons': [_assets.pear, _assets.pear],
      'choices': [_assets.num_7, _assets.num_8, _assets.num_9],
      'answer': _assets.num_8,
      'gradient': [
        _colors.darkYellow,
        _colors.lightYellow,
      ],
    },
    '9': {
      'color': _colors.selectedPink,
      'nav': _strings.mainMenu,
      'length': 9,
      'icons': [_assets.car, _assets.car],
      'choices': [_assets.num_7, _assets.num_8, _assets.num_9],
      'answer': _assets.num_9,
      'gradient': [
        _colors.darkPink,
        _colors.lightPink,
      ],
    },
  };
  Map letsOrder = {
    '4': {
      'color': _colors.selectedWarm,
      'length': 4,
      'nav': '7',
      'choices': [_assets.num_4, _assets.num_9, _assets.num_8],
      'progressive': [_assets.num_1, _assets.num_2, _assets.num_3],
      'progressiveColor': _colors.purple,
      'answer': _assets.num_4,
      'gradient': [
        _colors.darkWarm,
        _colors.lightWarm,
      ],
    },
    '7': {
      'color': _colors.selectedNavyBlue,
      'nav': _strings.letsOrder,
      'length': 4,
      'choices': [_assets.num_7, _assets.num_2, _assets.num_9],
      'progressive': [_assets.num_4, _assets.num_5, _assets.num_6],
      'progressiveColor': _colors.darkNavy,
      'answer': _assets.num_7,
      'gradient': [
        _colors.darkNavyBlue,
        _colors.lightNavyBlue,
      ],
    },
    '3': {
      'color': _colors.selectedRed,
      'nav': '6',
      'length': 4,
      'choices': [_assets.num_6, _assets.num_9, _assets.num_3],
      'progressive': [_assets.num_6, _assets.num_5, _assets.num_4],
      'progressiveColor': _colors.purple,
      'answer': _assets.num_3,
      'gradient': [
        _colors.darkRed,
        _colors.lightRed,
      ],
    },
    '6': {
      'color': _colors.selectedTurquoise,
      'nav': _strings.mainMenu,
      'length': 4,
      'choices': [_assets.num_6, _assets.num_9, _assets.num_4],
      'progressive': [_assets.num_9, _assets.num_8, _assets.num_7],
      'progressiveColor': _colors.darkNavy,
      'answer': _assets.num_6,
      'gradient': [
        _colors.darkTurquoise,
        _colors.lightTurquoise,
      ],
    },
  };
  Map comparison = {
    'lessThan': {
      'dice': false,
      'color': _colors.selectedPink,
      'length': 3,
      'nav': 'equal',
      'choices': [_assets.lessThan, _assets.equal, _assets.biggerThan],
      'icons': [_assets.board, _assets.teacher],
      'equation': [_assets.num_7, _assets.num_8],
      'answer': _assets.lessThan,
      'gradient': [
        _colors.darkPink,
        _colors.lightPink,
      ],
    },
    'equal': {
      'dice': true,
      'color': _colors.selectedPink,
      'length': 3,
      'nav': 'biggerThan1',
      'icons': [_assets.board, _assets.teacher],
      'choices': [_assets.lessThan, _assets.equal, _assets.biggerThan],
      'equation': [4, 4],
      'answer': _assets.equal,
      'gradient': [
        _colors.darkPink,
        _colors.lightPink,
      ],
    },
    'biggerThan1': {
      'dice': false,
      'color': _colors.selectedBlue,
      'length': 3,
      'nav': 'biggerThan2',
      'icons': [_assets.board, _assets.teacher],
      'choices': [
        _assets.blueLessThan,
        _assets.blueEqual,
        _assets.blueBiggerThan
      ],
      'equation': [_assets.num_9, _assets.num_8],
      'answer': _assets.blueBiggerThan,
      'gradient': [
        _colors.darkBlue,
        _colors.lightBlue,
      ],
    },
    'biggerThan2': {
      'dice': true,
      'color': _colors.selectedBlue,
      'length': 3,
      'icons': [_assets.board, _assets.teacher],
      'nav': _strings.mainMenu,
      'choices': [
        _assets.blueLessThan,
        _assets.blueEqual,
        _assets.blueBiggerThan
      ],
      'equation': [6, 4],
      'answer': _assets.blueBiggerThan,
      'gradient': [
        _colors.darkBlue,
        _colors.lightBlue,
      ],
    },
  };
  Map math = {
    '1p': {
      'dice': false,
      'kind': 'plus',
      'color': _colors.selectedPink,
      'selectedColor': _colors.purple_2,
      'length': 3,
      'nav': '2p',
      'choices': [_assets.num_8, _assets.num_9, _assets.num_4],
      'icons': [_assets.board, _assets.teacher],
      'equation': [_assets.num_6, _assets.num_3],
      'answer': _assets.num_9,
      'gradient': [
        _colors.darkPink,
        _colors.lightPink,
      ],
    },
    '2p': {
      'dice': true,
      'kind': 'plus',
      'color': _colors.selectedPink,
      'selectedColor': _colors.purple_2,
      'length': 3,
      'nav': '3p',
      'choices': [5, 4, 6],
      'icons': [_assets.board, _assets.teacher],
      'equation': [3, 2],
      'answer': 5,
      'gradient': [
        _colors.darkPink,
        _colors.lightPink,
      ],
    },
    '3p': {
      'dice': false,
      'kind': 'plus',
      'color': _colors.selectedPink,
      'selectedColor': _colors.purple_2,
      'length': 3,
      'nav': '4p',
      'choices': [_assets.num_6, _assets.num_8, _assets.num_4],
      'icons': [_assets.board, _assets.teacher],
      'equation': [_assets.num_2, _assets.num_4],
      'answer': _assets.num_6,
      'gradient': [
        _colors.darkPink,
        _colors.lightPink,
      ],
    },
    '4p': {
      'dice': true,
      'kind': 'plus',
      'color': _colors.selectedPink,
      'selectedColor': _colors.purple_2,
      'length': 3,
      'nav': _strings.plusAndMinus,
      'choices': [6, 4, 5],
      'icons': [_assets.board, _assets.teacher],
      'equation': [3, 3],
      'answer': 6,
      'gradient': [
        _colors.darkPink,
        _colors.lightPink,
      ],
    },
    '1m': {
      'dice': false,
      'kind': 'minus',
      'color': _colors.blue_2,
      'selectedColor': _colors.blue_2,
      'length': 3,
      'nav': '2m',
      'choices': [_assets.num_5, _assets.num_3, _assets.num_8],
      'icons': [_assets.board, _assets.teacher],
      'equation': [_assets.num_4, _assets.num_9],
      'answer': _assets.num_5,
      'gradient': [
        _colors.darkBlue,
        _colors.lightBlue,
      ],
    },
    '2m': {
      'dice': true,
      'kind': 'minus',
      'color': _colors.blue_2,
      'selectedColor': _colors.blue_2,
      'length': 3,
      'nav': '3m',
      'choices': [5, 4, 6],
      'icons': [_assets.board, _assets.teacher],
      'equation': [2, 6],
      'answer': 4,
      'gradient': [
        _colors.darkBlue,
        _colors.lightBlue,
      ],
    },
    '3m': {
      'dice': false,
      'kind': 'minus',
      'color': _colors.blue_2,
      'selectedColor': _colors.blue_2,
      'length': 3,
      'nav': '4m',
      'choices': [_assets.num_2, _assets.num_3, _assets.num_5],
      'icons': [_assets.board, _assets.teacher],
      'equation': [_assets.num_6, _assets.num_8],
      'answer': _assets.num_2,
      'gradient': [
        _colors.darkBlue,
        _colors.lightBlue,
      ],
    },
    '4m': {
      'dice': true,
      'kind': 'minus',
      'color': _colors.blue_2,
      'selectedColor': _colors.blue_2,
      'length': 3,
      'nav': _strings.mainMenu,
      'choices': [3, 4, 6],
      'icons': [_assets.board, _assets.teacher],
      'equation': [1, 4],
      'answer': 3,
      'gradient': [
        _colors.darkBlue,
        _colors.lightBlue,
      ],
    },
  };
  Map connect = {
    '1': {
      'dragPosition': {
        'width': 2.0,
        'height': 4.5,
      },
      'targetPosition': {
        'width': 2.3,
        'height': 1.45,
      },
      'color': _colors.selectedPink,
      'length': 3,
      'nav': '2',
      'number': 1,
      'drag': _assets.monkey,
      'target': _assets.banana_2,
      'progress': [
        _assets.progress1_1,
        _assets.progress1_2,
        _assets.progress1_3,
        _assets.progress1_4,
      ],
      'gradient': [
        _colors.darkPurple,
        _colors.lightPurple,
      ],
    },
    '2': {
      'dragPosition': {
        'width': 1.5,
        'height': 4.5,
      },
      'targetPosition': {
        'width': 6.0,
        'height': 1.45,
      },
      'color': _colors.selectedBlue,
      'length': 3,
      'nav': '',
      'number': 2,
      'drag': _assets.rabbit,
      'target': _assets.carrot,
      'progress': [
        _assets.progress2_1,
        _assets.progress2_2,
        _assets.progress2_3,
        _assets.progress2_4,
      ],
      'gradient': [
        _colors.darkNavyBlue,
        _colors.lightNavyBlue,
      ],
    },
    '3': {
      'dragPosition': {
        'width': 1.45,
        'height': 4.4,
      },
      'targetPosition': {
        'width': 5.0,
        'height': 1.4,
      },
      'color': _colors.selectedBlue,
      'length': 3,
      'nav': '',
      'number': 3,
      'drag': _assets.shark,
      'target': _assets.fish,
      'progress': [
        _assets.progress3_0,
        _assets.progress3_2,
        _assets.progress3_3,
        _assets.progress3_4,
      ],
      'gradient': [
        const Color.fromRGBO(140, 99, 228, 1),
        const Color.fromRGBO(195, 182, 254, 1)
      ],
    },
    '4': {
      'dragPosition': {
        'width': 2.6,
        'height': 3.8,
      },
      'targetPosition': {
        'width': 1.6,
        'height': 1.5,
      },
      'color': _colors.selectedBlue,
      'length': 3,
      'nav': '',
      'number': 4,
      'drag': _assets.cat,
      'target': _assets.mouse,
      'progress': [
        _assets.progress4_1,
        _assets.progress4_2,
        _assets.progress4_3,
      ],
      'gradient': [
        const Color.fromRGBO(255, 220, 126, 1),
        const Color.fromRGBO(255, 247, 219, 1)
      ],
    },
    '5': {
      'dragPosition': {
        'width': 2.3,
        'height': 3.5,
      },
      'targetPosition': {
        'width': 2.5,
        'height': 2.2,
      },
      'color': _colors.selectedBlue,
      'length': 3,
      'nav': '',
      'number': 5,
      'drag': _assets.earth5,
      'target': [_assets.sun_5, _assets.sun_5],
      'progress': [
        _assets.progress5_1,
        _assets.progress5_2,
        _assets.progress5_3,
        _assets.progress5_4,
      ],
      'gradient': [
        _colors.darkPurple,
        _colors.lightPurple,
      ],
    },
    '6': {
      'dragPosition': {
        'width': 8.0,
        'height': 4.5,
      },
      'targetPosition': {
        'width': 1.4,
        'height': 1.45,
      },
      'color': _colors.selectedBlue,
      'length': 3,
      'nav': '',
      'number': 6,
      'drag': _assets.chicken,
      'target': [_assets.egg, _assets.egg2],
      'progress': [
        _assets.progress6_1,
        _assets.progress6_2,
        _assets.progress6_3,
      ],
      'gradient': [
        const Color.fromRGBO(114, 228, 228, 1),
        const Color.fromRGBO(199, 249, 249, 0.85)
      ],
    },
    '7': {
      'dragPosition': {
        'width': 1.3,
        'height': 3.5,
      },
      'targetPosition': {
        'width': 13.0,
        'height': 4.0,
      },
      'color': _colors.selectedBlue,
      'length': 3,
      'nav': '',
      'number': 7,
      'drag': _assets.pen,
      'target': [_assets.openBook, _assets.book],
      'progress': [
        _assets.progress7_1,
        _assets.progress7_2,
        _assets.progress7_3,
      ],
      'gradient': [
        const Color.fromRGBO(204, 215, 255, 1),
        const Color.fromRGBO(133, 160, 255, 1)
      ],
    },
    '8': {
      'dragPosition': {
        'width': 1.3,
        'height': 1.55,
      },
      'targetPosition': {
        'width': 13.0,
        'height': 1.55,
      },
      'color': _colors.selectedBlue,
      'length': 3,
      'nav': '',
      'number': 8,
      'drag': _assets.leaf,
      'target': [_assets.tree, _assets.tree],
      'progress': [
        _assets.progress8_1,
        _assets.progress8_2,
        _assets.progress8_3,
      ],
      'gradient': [
        const Color.fromRGBO(255, 176, 176, 1),
        const Color.fromRGBO(255, 214, 214, 1)
      ],
    },
    '9': {
      'dragPosition': {
        'width': 2.5,
        'height': 2.35,
      },
      'targetPosition': {
        'width': 1.6,
        'height': 1.45,
      },
      'color': _colors.selectedBlue,
      'length': 3,
      'nav': '',
      'number': 8,
      'drag': _assets.apple9,
      'target': [_assets.appleBasket, _assets.appleFinal],
      'progress': [
        _assets.progress9_1,
        _assets.progress9_2,
        _assets.progress9_3,
        _assets.progress9_4,
        _assets.progress9_5,
      ],
      'gradient': [
        const Color.fromRGBO(82, 104, 180, 1),
        const Color.fromRGBO(156, 178, 255, 1)
      ],
    },
  };
  Map finalTest = {
    'finalMathPlus': {
      'dice': true,
      'kind': 'plus',
      'color': _colors.selectedPink,
      'selectedColor': _colors.purple_2,
      'length': 3,
      'nav': 'final',
      'next': 'finalSun',
      'choices': [6, 4, 5],
      'icons': [_assets.board, _assets.teacher],
      'equation': [3, 3],
      'answer': 6,
      'gradient': [
        _colors.darkPink,
        _colors.lightPink,
      ],
    },
    'finalSun': {
      'nav': 'final',
      'next': 'finalMathMinus',
      'length': 3,
      'icons': [_assets.sun, _assets.sun],
      'choices': [_assets.earth, _assets.leaf, _assets.pen],
      'answer': _assets.earth,
      'gradient': [
        const Color.fromRGBO(195, 118, 255, 1),
        const Color.fromRGBO(222, 194, 255, 1),
      ],
    },
    'finalMathMinus': {
      'dice': false,
      'kind': 'minus',
      'color': _colors.blue_2,
      'selectedColor': _colors.blue_2,
      'length': 3,
      'nav': 'final',
      'next': 'finalLetsCount',
      'choices': [_assets.num_2, _assets.num_3, _assets.num_5],
      'icons': [_assets.board, _assets.teacher],
      'equation': [_assets.num_6, _assets.num_8],
      'answer': _assets.num_2,
      'gradient': [
        _colors.darkBlue,
        _colors.lightBlue,
      ],
    },
    'finalLetsCount': {
      'color': _colors.selectedRed,
      'nav': 'final',
      'next': 'finalEqual',
      'length': 5,
      'icons': [_assets.penguin, _assets.penguin],
      'choices': [_assets.num_4, _assets.num_6, _assets.num_5],
      'answer': _assets.num_5,
      'gradient': [
        _colors.darkRed,
        _colors.lightRed,
      ],
    },
    'finalEqual': {
      'dice': true,
      'color': _colors.selectedPink,
      'length': 3,
      'nav': 'final',
      'next': 'finalCircle',
      'icons': [_assets.board, _assets.teacher],
      'choices': [_assets.lessThan, _assets.equal, _assets.biggerThan],
      'equation': [4, 4],
      'answer': _assets.equal,
      'gradient': [
        _colors.darkPink,
        _colors.lightPink,
      ],
    },
    'finalCircle': {
      'nav': 'final',
      'next': 'finalLetsOrder',
      'length': 3,
      'icons': [_assets.circle, _assets.circle_1],
      'choices': [_assets.triangle_1, _assets.circle_1, _assets.square_1],
      'answer': _assets.circle_1,
      'gradient': [
        _colors.darkBlue,
        _colors.lightBlue,
      ],
    },
    'finalLetsOrder': {
      'color': _colors.selectedRed,
      'nav': 'final',
      'next': 'finalComparison',
      'length': 4,
      'choices': [_assets.num_6, _assets.num_9, _assets.num_3],
      'progressive': [_assets.num_6, _assets.num_5, _assets.num_4],
      'progressiveColor': _colors.purple,
      'answer': _assets.num_3,
      'gradient': [
        _colors.darkRed,
        _colors.lightRed,
      ],
    },
    'finalComparison': {
      'dice': false,
      'color': _colors.selectedBlue,
      'length': 3,
      'nav': 'final',
      'next': 'finalCrab',
      'icons': [_assets.board, _assets.teacher],
      'choices': [
        _assets.blueLessThan,
        _assets.blueEqual,
        _assets.blueBiggerThan
      ],
      'equation': [_assets.num_9, _assets.num_8],
      'answer': _assets.blueBiggerThan,
      'gradient': [
        _colors.darkBlue,
        _colors.lightBlue,
      ],
    },
    'finalCrab': {
      'nav': 'final',
      'next': 'finalMemory',
      'length': 3,
      'icons': [_assets.crab, _assets.crab],
      'choices': [_colors.red, _colors.green, _colors.yellow],
      'answer': _colors.red,
      'gradient': [
        _colors.darkBlue,
        _colors.lightBlue,
      ],
    },
  };
}
