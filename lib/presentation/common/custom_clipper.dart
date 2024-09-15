import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class BuildCustomClipper extends StatelessWidget {
  const BuildCustomClipper({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: MyCustomClipper(),
        child: Container(
          color: Colors.red,
          height: 173,
        ));
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width * 0.25, size.height, size.width * 0.5, size.height / 3);
    path.quadraticBezierTo(size.width * 0.75, size.height / 2, size.width, 0);
    path.quadraticBezierTo(size.width * 0.75, size.height / 2, size.width, 0);
    //path.quadraticBezierTo(size.width*0.8, size.height/4, size.width, 0);
    //path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class TopCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width, 30);
    path_0.cubicTo(378.499, 100.995, 296.766, 77.7836, 178.826, 77.7836);
    path_0.cubicTo(-32.0005, 112.496, -1.00066, 291.496, -1.00066, 3.49553);
    path_0.cubicTo(-1.00066, -19.6591, 87.5594, -1.50476, 205.499, -1.50476);
    path_0.cubicTo(323.439, -1.50476, 378.499, -22.5044, size.width, 0);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.51, 0),
        Offset(size.width * 1.01, size.height * 0.50),
        [const Color(0xFFFFDFD8), const Color(0xFFFFF4F2)],
        [0.00, 1.00]);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BottomCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    paintFill0.shader = ui.Gradient.linear(
        Offset(size.width, size.height),
        Offset(size.width * 0.50, size.height * 0.64),
        [const Color(0xFFFFDFD8), const Color(0xFFFFF4F2)],
        [0.00, 1.00]);

    Path path_0 = Path();
    path_0.moveTo(size.width, size.height);
    path_0.lineTo(size.width, size.height * 0.6395349);
    path_0.quadraticBezierTo(size.width * 0.9030488, size.height * 0.6357558,
        size.width * 0.7804878, size.height * 0.7267442);
    path_0.cubicTo(
        size.width * 0.6676829,
        size.height * 0.7732558,
        size.width * 0.3835366,
        size.height * 0.7802326,
        size.width * 0.2853659,
        size.height * 0.7941860);
    path_0.cubicTo(
        size.width * 0.1865854,
        size.height * 0.8122093,
        size.width * 0.2085366,
        size.height * 0.8680233,
        size.width * 0.1439024,
        size.height * 0.8953488);
    path_0.quadraticBezierTo(
        size.width * -0.0060976, size.height * 0.9473837, 0, size.height);

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(0, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}






//Copy this CustomPainter code to the Bottom of the File
class SideCutContainer extends CustomPainter {
@override
void paint(Canvas canvas, Size size) {

Path path_0 = Path();
path_0.moveTo(15.6858,21.5224);
path_0.cubicTo(9.16208,12.5712,15.5557,0,26.6318,0);
path_0.lineTo(268.387,0);
path_0.cubicTo(280.244,0,287.356,13.1725,280.85,23.0857);
path_0.lineTo(279.864,24.5886);
path_0.cubicTo(276.955,29.021,277.188,34.8126,280.442,38.9974);
path_0.cubicTo(286.774,47.1383,280.973,59,270.66,59);
path_0.lineTo(26.6318,59);
path_0.cubicTo(15.5557,59,9.16208,46.4288,15.6858,37.4776);
path_0.cubicTo(19.1506,32.7235,19.1506,26.2765,15.6858,21.5224);
path_0.close();

Paint paint0Fill = Paint()..style=PaintingStyle.fill;
paint0Fill.color = const Color(0xffE7684A).withOpacity(1.0);
canvas.drawPath(path_0,paint0Fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
return true;
}
}
