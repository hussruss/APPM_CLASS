import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TargetPlatformDemo extends StatelessWidget {
  const TargetPlatformDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (defaultTargetPlatform == TargetPlatform.android) ...[
            Center(
              child: Text(
                'Android',
                style: TextStyle(fontSize: 74),
              ),
            )
          ] else if (defaultTargetPlatform == TargetPlatform.iOS) ...[
            Center(
              child: Text(
                'iOS',
                style: TextStyle(fontSize: 74),
              ),
            )
          ] else ...[
            Center(
              child: Text(
                'Web',
                style: TextStyle(fontSize: 74),
              ),
            )
          ]
        ],
      ),
    );
  }
}
