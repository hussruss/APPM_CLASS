import 'package:flutter/material.dart';

class ClipRectWidget extends StatelessWidget {
  const ClipRectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ClipRectWidget'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                // clipper: MyCustomClipper(),
                child: Container(
                  width: 300,
                  height: 400,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.blue,
                    Colors.blue.shade500,
                    Colors.blueGrey
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
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

class MyCustomClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(50, 100, 200, 200);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => true;
}
