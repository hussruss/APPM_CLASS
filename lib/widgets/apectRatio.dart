import 'package:flutter/material.dart';

class AspectRatioWidget extends StatelessWidget {
  const AspectRatioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AspectRatio'),
      ),
      body: ListView(scrollDirection: Axis.horizontal, children: [
        Container(
          child: Center(
            child: Container(
              height: 300,
              color: Colors.green,
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  _buildProgressBar(4 / 10, '40%'),
                  _buildProgressBar(6 / 10, '60%'),
                  _buildProgressBar(8 / 10, '80%'),
                  _buildProgressBar(10 / 10, '100%'),
                ],
              ),
            ),
          ),
        ),
        _buildAspectRatio(1 / 10),
        _buildAspectRatio(5 / 10),
        _buildAspectRatio(10 / 10),
        _buildAspectRatio(15 / 10),
        _buildAspectRatio(20 / 10),
      ]),
    );
  }

  _buildProgressBar(double aspectRatio, String progress) {
    return Container(
      height: 60,
      color: Colors.orange,
      alignment: Alignment.center,
      child: AspectRatio(
          aspectRatio: aspectRatio,
          child: Container(
            color: Colors.grey,
            child: Text(progress),
          )),
    );
  }

  Container _buildAspectRatio(double aspectRatio) {
    return Container(
      width: 400,
      child: Center(
        child: Container(
            width: 300,
            height: 300,
            color: Colors.green,
            alignment: Alignment.topLeft,
            child: AspectRatio(
              aspectRatio: aspectRatio,
              child: Container(
                color: Colors.orange,
              ),
            )),
      ),
    );
  }
}
