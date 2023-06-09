import 'package:flutter/material.dart';

class FittedBoxWidget extends StatelessWidget {
  const FittedBoxWidget({super.key});

  onTap() {
    try {} catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FittedBox'),
        ),
        body: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildFittedBoxItem(BoxFit.contain),
            _buildFittedBoxItem(BoxFit.cover),
            _buildFittedBoxItem(BoxFit.fill),
            _buildFittedBoxItem(BoxFit.fitHeight),
            _buildFittedBoxItem(BoxFit.fitWidth),
            _buildFittedBoxItem(BoxFit.scaleDown),
          ],
        ));
  }

  Container _buildFittedBoxItem(BoxFit fit) {
    return Container(
      width: 400,
      child: Center(
        child: Container(
          color: Colors.green,
          width: 200,
          height: 200,
          child: FittedBox(
            fit: fit,
            child: Image.network(
                'https://www.tutorialesprogramacionya.com/composeya/imagentema/foto026.png'),
          ),
        ),
      ),
    );
  }

  Column _buildFittedBoxExample() {
    return Column(
      children: [
        Container(
          color: Colors.red,
          height: 300,
          width: 300,
          child: FittedBox(
            fit: BoxFit.fitHeight,
            clipBehavior: Clip.hardEdge,
            child: Container(
              color: Colors.green,
              height: 50,
              width: 50,
              child: Center(
                child: Text(
                  'Hello World!',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
        Container(
          color: Colors.red,
          height: 300,
          width: 300,
          child: FittedBox(
              fit: BoxFit.cover,
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                  'https://source.unsplash.com/random/1280x720/?face')),
        )
      ],
    );
  }
}
