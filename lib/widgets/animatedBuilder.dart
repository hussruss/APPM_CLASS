import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedBuilderWidget extends StatefulWidget {
  const AnimatedBuilderWidget({super.key});

  @override
  State<AnimatedBuilderWidget> createState() => _AnimatedBuilderWidgetState();
}

class _AnimatedBuilderWidgetState extends State<AnimatedBuilderWidget>
    with SingleTickerProviderStateMixin {
  late Animation<int> _animation;
  late AnimationController _animationController;
  late Animation<double> _animationSize;
  late Animation<Color?> _animationColor;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 8));
    _animation = IntTween(begin: 0, end: 1000).animate(_animationController);
    _animationSize =
        Tween(begin: 100.0, end: 300.0).animate(_animationController);
    _animationColor = ColorTween(begin: Colors.amber, end: Colors.blue)
        .animate(_animationController);
    // _animationController.addListener(() {
    //   setState(() {});
    // });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Text(
                _animation.value.toString(),
                style: TextStyle(fontSize: 30),
              );
            },
          ),
          Text(
            _animation.value.toString(),
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 30,
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Container(
                width: _animationSize.value,
                height: _animationSize.value,
                color: _animationColor.value,
              );
            },
          ),
          ElevatedButton(
              onPressed: () {
                if (_animationController.status == AnimationStatus.completed) {
                  _animationController.reset();
                  _animationController.forward();
                } else {
                  _animationController.forward();
                }
              },
              child: Text('Start'))
        ],
      ),
    );
  }
}
