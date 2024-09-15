
import 'package:flutter/material.dart';
class Bubble extends StatelessWidget {
  final double width;
  final double height;
  const Bubble( this.width,this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Color(0xFFFFDFD8), Color(0xFFFFF4F2)],
          begin: Alignment.topCenter,end: Alignment.bottomCenter,
        )

      ),
    );
  }
}
