import 'package:flutter/material.dart';

class CustomPaintWidget extends StatelessWidget {
  const CustomPaintWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomPaintWidget'),
      ),
      body: Center(
        child: CustomPaint(
          painter: HeartPainter(),
          child: Container(
            width: 300,
            height: 300,
          ),
        ),
      ),
    );
  }
}




class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 8
      ..style = PaintingStyle.fill;
    final Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.8, size.height);
    path.lineTo(size.width * 0.8, size.height - 100);
    path.close();

    // path.moveTo(size.width * 0.2010000, size.height * 0.5804167);
    // path.lineTo(size.width * 0.4010000, size.height * 0.5783333);
    // path.quadraticBezierTo(size.width * 0.3475000, size.height * 0.4358333,
    //     size.width * 0.3980000, size.height * 0.2466667);
    // path.quadraticBezierTo(size.width * 0.2847500, size.height * 0.3708333,
    //     size.width * 0.2010000, size.height * 0.5804167);
    // path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) => true;
}

class HeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6;

    Paint paint1 = Paint();
    paint1
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;

    double width = size.width;
    double height = size.height;

    Path path = Path();
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.2 * width, height * 0.1, -0.25 * width, height * 0.6,
        0.5 * width, height);
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.8 * width, height * 0.1, 1.25 * width, height * 0.6,
        0.5 * width, height);

    canvas.drawPath(path, paint1);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(HeartPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(HeartPainter oldDelegate) => false;
}
