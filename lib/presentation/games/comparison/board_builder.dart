import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgBuilder extends StatelessWidget {
  const SvgBuilder({super.key, required this.path, this.color,this.width=50,this.height});
  final String path;
  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(path,
       fit: BoxFit.fitWidth,
       height:height ,
       color: color,
      width: width,
    );
  }
}
