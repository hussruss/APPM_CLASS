import 'package:flutter/material.dart';

class ClipPathWidget extends StatelessWidget {
  const ClipPathWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ClipPathWidget'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ClipPath(
                clipper: MyCustomClipper(),
                child: Container(
                  width: 300,
                  height: 300,
                  color: Colors.blue,
                  child: Center(
                    child: FlutterLogo(
                      size: 200,
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(size.width / 2, 50);

    // path.moveTo(size.width * 0.2000000, size.height * 0.3100000);
    // path.quadraticBezierTo(size.width * 0.2007500, size.height * 0.5440667,
    //     size.width * 0.2010000, size.height * 0.5804167);
    // path.lineTo(size.width * 0.4010000, size.height * 0.5783333);
    // path.quadraticBezierTo(size.width * 0.3987500, size.height * 0.3295833,
    //     size.width * 0.3980000, size.height * 0.2466667);
    // path.cubicTo(
    //     size.width * 0.3472500,
    //     size.height * 0.3250000,
    //     size.width * 0.2972500,
    //     size.height * 0.2354167,
    //     size.width * 0.2000000,
    //     size.height * 0.3100000);
    // path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
