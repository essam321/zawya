import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mind_games/models/card_item.dart';
import 'package:mind_games/presentation/resources/assets.dart';
import 'package:mind_games/presentation/resources/colors.dart';

class MemoryCard extends StatefulWidget {
  MemoryCard({
    required this.card,
    required this.index,
    required this.onCardPressed,
    super.key,
  });

  final CardItem card;
  final int index;
  final ValueChanged<int> onCardPressed;

  @override
  State<MemoryCard> createState() => _MemoryCardState();
}

class _MemoryCardState extends State<MemoryCard> {
  final AppColors _colors = AppColors();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 1,milliseconds: 500),
      () {
        setState(() {
          hint = false;
        });
      },
    );
  }

  final ImageAssets _assets = ImageAssets();

  bool hint = true;

  void _handleCardTap() {
    if (widget.card.state == CardState.hidden) {
      Timer(const Duration(milliseconds: 10), () {
        widget.onCardPressed(widget.index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return hint == true
        ? MaterialButton(
            height: 10,
            minWidth: 10,
            padding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onPressed: () {},
            child: Container(
                padding: EdgeInsets.zero,
                width: 120,
                height: 160,
                decoration: BoxDecoration(
                    color: _colors.cardColor,
                    borderRadius: BorderRadius.circular(20)),
                // margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Image.asset(widget.card.icon)))
        : MaterialButton(
            height: 10,
            minWidth: 10,
            padding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onPressed: () => _handleCardTap(),
            child: Container(
              padding: EdgeInsets.zero,
              width: 120,
              height: 160,
              decoration: BoxDecoration(
                  color: _colors.cardColor,
                  borderRadius: BorderRadius.circular(20)),
              // margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: widget.card.state == CardState.visible ||
                      widget.card.state == CardState.guessed
                  ? Image.asset(widget.card.icon)
                  : Image.asset(fit: BoxFit.cover, _assets.card),
            )).animate().flipH(duration: Duration(seconds: 1));
  }
}
