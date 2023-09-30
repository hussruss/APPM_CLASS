import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Refactor2Screen extends StatefulWidget {
  const Refactor2Screen({super.key});

  @override
  State<Refactor2Screen> createState() => _Refactor2ScreenState();
}

class _Refactor2ScreenState extends State<Refactor2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          WaveWidget(
            config: CustomConfig(
              gradients: [
                [Colors.deepPurple, Colors.deepPurple.shade200],
                [Colors.indigo.shade200, Colors.purple.shade200],
              ],
              durations: [19440, 10800],
              heightPercentages: [0.20, 0.23],
              gradientBegin: Alignment.bottomLeft,
              gradientEnd: Alignment.topRight,
            ),
            waveAmplitude: 0,
            size: Size(double.infinity, double.infinity),
          ),
          Center(
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.jpeg'),
                  radius: 30,
                ),
                title: Text('Nombre de Usuario'),
                subtitle: Text('Flutter Developer'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
