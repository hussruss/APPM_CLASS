import 'package:flutter/material.dart';

class ClipOvalWidget extends StatelessWidget {
  const ClipOvalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ClipOvalWidget'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
                clipper: MyCustomClipper(),
                child: Image.network(
                  'https://source.unsplash.com/random/250×250/?person',
                  height: 400,
                  width: 400,
                  fit: BoxFit.cover,
                )),
          ],
        ));
  }
}

class MyCustomClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, 400, 300);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}
