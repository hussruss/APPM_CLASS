import 'package:flutter/material.dart';

class PositionedTransitionWidget extends StatefulWidget {
  @override
  _PositionedTransitionWidgetState createState() =>
      _PositionedTransitionWidgetState();
}

class _PositionedTransitionWidgetState extends State<PositionedTransitionWidget>
    with SingleTickerProviderStateMixin {
  late Animation<RelativeRect> _animation;
  late Animation<RelativeRect> _animation1;
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _animation = RelativeRectTween(
            begin: RelativeRect.fromLTRB(150, 300, 150, -500),
            end: RelativeRect.fromLTRB(0, 0, 0, 0))
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.bounceIn));
    _animation1 = RelativeRectTween(
            begin: RelativeRect.fromLTRB(0, -800, 0, 0),
            end: RelativeRect.fromLTRB(150, -400, 150, 0))
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.bounceIn));

    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Positioned Transition Example'),
      ),
      body: Center(
        child: Stack(children: [
          PositionedTransition(
              rect: _animation,
              child: FlutterLogo(
                duration: Duration(seconds: 0),
              )),
          PositionedTransition(
              rect: _animation1,
              child: FlutterLogo(
                size: 20,
                duration: Duration(seconds: 0),
                style: FlutterLogoStyle.horizontal,
              ))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _animationController.forward();
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
