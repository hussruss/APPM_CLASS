import 'dart:math';

import 'package:flutter/material.dart';

class RandomScreen extends StatefulWidget {
  const RandomScreen({super.key});

  @override
  State<RandomScreen> createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {
  int _counter = 0;
  int _randomImageIndex = 0;
  Color _color = Color.fromRGBO(255, 255, 255, 1);

  Color _getRandomColor() {
    final int r = Random().nextInt(255);
    final int g = Random().nextInt(255);
    final int b = Random().nextInt(255);
    final double o = Random().nextDouble();
    return Color.fromRGBO(r, g, b, o);
  }

  void _incrementNumber() {
    _counter = _counter + 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
      body: GestureDetector(
        onTap: () {
          _incrementNumber();
          _color = _getRandomColor();
          _randomImageIndex = Random().nextInt(100);
        },
        child: Stack(
          children: [
            Image.network(
              'https://source.unsplash.com/random/250×250/?cats&${_randomImageIndex}',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
            ),
            Center(
              child: Text(
                'Counter $_counter',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
