import 'dart:ui';

import 'package:flutter/material.dart';

class BackDropFilterWidget extends StatelessWidget {
  const BackDropFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BackDropFilterWidget'),
        ),
        body: Stack(
          children: [
            Image.network('https://source.unsplash.com/random/250×250/?cars'),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              // filter: ImageFilter.dilate(radiusX: 5, radiusY: 5),
              //filter: ImageFilter.erode(radiusX: 2, radiusY: 2),
              // filter: ImageFilter.matrix(Matrix4.rotationZ(0.5).storage),
              // filter: ImageFilter.compose(
              //     outer: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              //     inner: ImageFilter.dilate(radiusX: 1, radiusY: 1)),
              child: Container(),
            )
          ],
        ));
  }
}
