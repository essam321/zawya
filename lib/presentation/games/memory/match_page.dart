import 'package:flutter/material.dart';
import 'package:mind_games/models/game.dart';
import 'package:mind_games/presentation/games/memory/widgets/memory_card.dart';

class MemoryMatchPage extends StatefulWidget {
  final Game game;

  const MemoryMatchPage({super.key, required this.game});

  @override
  State<MemoryMatchPage> createState() => _MemoryMatchPageState();
}

class _MemoryMatchPageState extends State<MemoryMatchPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const FixedExtentScrollPhysics(),
      crossAxisCount: widget.game.gridSize,
      children: List.generate(
          widget.game.cards.length,
          (index) => MemoryCard(
              card: widget.game.cards[index],
              index: index,
              onCardPressed: widget.game.onCardPressed)),
    );
  }
}
