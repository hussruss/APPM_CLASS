import 'package:flutter/material.dart';

class CounterAnimated extends StatefulWidget {
  const CounterAnimated({super.key});

  @override
  State<CounterAnimated> createState() => _CounterAnimatedState();
}

class _CounterAnimatedState extends State<CounterAnimated> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Contador ',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
              width: MediaQuery.of(context).size.width,
            ),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Start')),
                ElevatedButton(onPressed: () {}, child: Text('Start')),
                ElevatedButton(onPressed: () {}, child: Text('Start'))
              ],
            )
          ],
        );
      }),
    );
  }
}
