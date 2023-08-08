import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mic_stream/mic_stream.dart';

class MicrophoneScreen extends StatefulWidget {
  const MicrophoneScreen({super.key});

  @override
  State<MicrophoneScreen> createState() => _MicrophoneScreenState();
}

class _MicrophoneScreenState extends State<MicrophoneScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
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
      ),
    );
  }
}
