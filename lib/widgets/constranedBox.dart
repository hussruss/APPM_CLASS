import 'package:flutter/material.dart';

class ConstrainedBoxWidget extends StatelessWidget {
  const ConstrainedBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConstrainedBox'),
      ),
      body: Container(
        child: ConstrainedBox(
          constraints: BoxConstraints.tightForFinite(
              width: double.infinity, height: double.infinity),
          child: Container(
            color: Colors.orange,
            child: Center(
              child: Text(
                'BoxConstraints.tight',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
          ),
        ),
      ),

      // Container(
      //   child: ConstrainedBox(
      //     constraints: BoxConstraints.tightFor(width: 300),
      //     child: Container(
      //       width: 400,
      //       height: 200,
      //       color: Colors.orange,
      //       child: Center(
      //         child: Text(
      //           'BoxConstraints.tight',
      //           style: TextStyle(fontSize: 40, color: Colors.white),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),

      // Container(
      //   child: ConstrainedBox(
      //     constraints: BoxConstraints.tight(Size(100, 100)),
      //     child: Container(
      //       width: 200,
      //       height: 200,
      //       color: Colors.orange,
      //       child: Center(
      //         child: Text(
      //           'BoxConstraints.tight',
      //           style: TextStyle(fontSize: 40, color: Colors.white),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),

      // Container(
      //   child: ConstrainedBox(
      //     constraints: BoxConstraints.loose(Size(200, 300)),
      //     child: Container(
      //       width: 200,
      //       height: 400,
      //       color: Colors.purple,
      //       child: Center(
      //         child: Text(
      //           'BoxConstraints.loose',
      //           style: TextStyle(fontSize: 40, color: Colors.white),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),

      // Container(
      //   child: ConstrainedBox(
      //     constraints: BoxConstraints.expand(),
      //     child: Container(
      //       width: 200,
      //       height: 200,
      //       color: Colors.blue,
      //       child: Center(
      //         child: Text(
      //           'BoxConstraints. expand',
      //           style: TextStyle(fontSize: 40, color: Colors.white),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),

      // Container(
      //   child: ConstrainedBox(
      //     constraints: BoxConstraints(
      //         maxHeight: 300, minHeight: 200, maxWidth: 300, minWidth: 200),
      //     child: Container(
      //       width: 200,
      //       height: 200,
      //       color: Colors.blue,
      //       child: Center(
      //         child: Text(
      //           'BoxConstraints',
      //           style: TextStyle(fontSize: 40, color: Colors.white),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
