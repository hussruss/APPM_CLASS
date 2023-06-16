import 'dart:math';

import 'package:flutter/material.dart';

class TransformWidget extends StatelessWidget {
  const TransformWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TransformWidget'),
      ),
      body: Center(
        child: Transform.translate(
          offset: Offset(20, -100),
          child: Container(
            width: 300,
            height: 300,
            color: Colors.black,
            child: Center(
                child: FlutterLogo(
              size: 220,
            )),
          ),
        ),
      ),
    );
  }
}

class TransformEejemplo extends StatelessWidget {
  const TransformEejemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // doorway
      margin: const EdgeInsets.only(left: 60, top: 60),
      width: 200,
      height: 400,
      color: Colors.black87,

      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(0.7),
        alignment: Alignment.centerLeft,
        child: Container(
          // door
          width: 300,
          height: 400,
          color: Colors.orangeAccent,
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 30),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              shape: BoxShape.circle,
            ),
            width: 30,
            height: 30,
          ),
        ),
      ),
    );
  }
}
