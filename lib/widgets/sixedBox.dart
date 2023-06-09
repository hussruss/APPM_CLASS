import 'package:flutter/material.dart';

class SizedBoxWidget extends StatelessWidget {
  const SizedBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SizedBox'),
      ),
      body: Column(
        children: [
          Container(
            //margin: EdgeInsets.only(bottom: 8),
            color: Colors.green,
            height: 80,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.orange,
            height: 80,
          ),
          SizedBox(
            width: 200,
            height: 200,
            child: Image.network(
                'https://www.tutorialesprogramacionya.com/composeya/imagentema/foto026.png'),
          ),
          Container(
            height: 200,
            child: SizedBox.expand(
              child: Container(
                color: Colors.purple,
              ),
            ),
          ),
          SizedBox.fromSize(
            size: Size(300, 100),
            child: Container(
              color: Colors.pink,
            ),
          ),
          SizedBox.shrink(
            child: Container(
              color: Colors.amber,
            ),
          )
        ],
      ),
    );
  }
}
