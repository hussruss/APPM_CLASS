import 'package:flutter/material.dart';

class OpacityWidget extends StatelessWidget {
  const OpacityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OpacityWidget'),
      ),
      body: Center(
        child: Opacity(
          opacity: 0.5,
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
