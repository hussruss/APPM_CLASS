import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

class FlashlightScreen extends StatefulWidget {
  const FlashlightScreen({super.key});

  @override
  State<FlashlightScreen> createState() => _FlashlightScreenState();
}

class _FlashlightScreenState extends State<FlashlightScreen> {
  bool _isFlashOn = false;

  void _toggleFlashlight() async {
    if (_isFlashOn) {
      await TorchLight.enableTorch();
    } else {
      await TorchLight.disableTorch();
    }
    _isFlashOn = !_isFlashOn;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.pink, Colors.purple],
            ),
          ),
          child: Center(
            child: ElevatedButton(
                onPressed: () {
                  _toggleFlashlight();
                },
                child: Text(
                    _isFlashOn ? 'Turn Off Flashlight' : 'Turn On Flashlight')),
          )),
    );
  }
}
