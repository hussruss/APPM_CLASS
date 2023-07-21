import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late Animation<double> _animationText;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _animation =
        Tween<double>(begin: 60, end: 180).animate(_animationController);
    _animationText =
        Tween<double>(begin: 0, end: 25).animate(_animationController);
    _animationController.forward();

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushNamed('/');
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterLogo(
                  size: _animation.value,
                  duration: Duration(seconds: 0),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Welcome to Flutter App!',
                  style: TextStyle(fontSize: _animationText.value),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
