import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget>
    with SingleTickerProviderStateMixin {
  double _width = 200;
  double _height = 200;
  Color _color = Colors.red;
  double _radius = 20;

  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AnimatedContainer Demo'),
        ),
        body: Center(
          child: RotationTransition(
            turns: _animation,
            child: AnimatedContainer(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                  color: _color, borderRadius: BorderRadius.circular(_radius)),
              duration: const Duration(milliseconds: 500),
              curve: Curves.bounceInOut,
              child: const FlutterLogo(),
              // child: Center(
              //     child: Text(
              //   _animation.value.toString(),
              //   style: TextStyle(fontSize: 40),
              // )),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              final random = Random();
              _width = random
                  .nextInt(MediaQuery.of(context).size.width.toInt())
                  .toDouble();
              _height = random
                  .nextInt(MediaQuery.of(context).size.height.toInt())
                  .toDouble();
              _color = Colors.primaries[random.nextInt(16)];
              _radius = random.nextInt(50).toDouble();

              if (_animationController.status == AnimationStatus.completed) {
                _animationController.reverse();
              } else {
                _animationController.forward();
              }
            });
          },
          child: Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
