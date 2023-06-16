import 'package:flutter/material.dart';

class RotatedWidget extends StatelessWidget {
  const RotatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RotatedWidget'),
      ),
      body: Center(
        child: RotatedBox(
          quarterTurns: 6,
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
