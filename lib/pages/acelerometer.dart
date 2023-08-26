import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:math';

class AccelerometerScreen extends StatefulWidget {
  @override
  _AccelerometerScreenState createState() => _AccelerometerScreenState();
}

class _AccelerometerScreenState extends State<AccelerometerScreen> {
  Color _color = Colors.green;
  int _randomImageIndex = 0;

  late Stream<AccelerometerEvent> _acelerometerStream;

  Color _getRandomColor() {
    final int r = Random().nextInt(255);
    final int g = Random().nextInt(255);
    final int b = Random().nextInt(255);
    final double o = Random().nextDouble();
    return Color.fromRGBO(r, g, b, o);
  }

  @override
  void initState() {
    super.initState();
    _acelerometerStream = accelerometerEvents;
    _acelerometerStream.listen((AccelerometerEvent event) {
      if (event.y.abs() > 18.0) {
        print("Y: ${event.y.abs()}");
        _color = _getRandomColor();
        _randomImageIndex = Random().nextInt(100);

        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _acelerometerStream.distinct();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: _color,
        body: Stack(
          children: [
            Image.network(
              'https://source.unsplash.com/random/250×250/?dogs&${_randomImageIndex}',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
            ),
            Center(
              child: Text(
                'Agita tu dispositivo!',
                style: TextStyle(fontSize: 35, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
