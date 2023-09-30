import 'package:flutter/material.dart';

class RefactorScreen extends StatefulWidget {
  const RefactorScreen({super.key});

  @override
  State<RefactorScreen> createState() => _RefactorScreenState();
}

class _RefactorScreenState extends State<RefactorScreen> {
  int _count = 0;

  void _incrementCounter() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Rebuild Full Screen');
    return Scaffold(
        floatingActionButton: _buildFloatingActionButton(), body: _buildBody());
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: _incrementCounter,
      child: const Icon(Icons.plus_one),
    );
  }

  Stack _buildBody() {
    return Stack(
      children: [const BackGround(), _buildCounter()],
    );
  }

  Center _buildCounter() {
    return Center(
      child: Text(
        _count.toString(),
        style: const TextStyle(
            fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Positioned _buildBackground() {
    print('Rebuild Background');

    return Positioned.fill(
      child: Image.asset(
        'assets/images/bg.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}

class BackGround extends StatelessWidget {
  const BackGround({super.key});

  @override
  Widget build(BuildContext context) {
    print('Rebuild Background');

    return Positioned.fill(
      child: Image.asset(
        'assets/images/bg.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}

// class RefactorScreen extends StatefulWidget {
//   const RefactorScreen({super.key});

//   @override
//   State<RefactorScreen> createState() => _RefactorScreenState();
// }

// class _RefactorScreenState extends State<RefactorScreen> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: _buildAppBar(), body: _buildBody());
//   }

//   AppBar _buildAppBar() {
//     return AppBar(title: Text('Refactor Screen'));
//   }

//   Column _buildBody() {
//     return Column(
//       children: [
//         _buildButton(
//             title: 'Botón 1',
//             onPressed: () {
//               print('Botón 1 presionado');
//             }),
//         _buildButton(
//             title: 'Botón 2',
//             onPressed: () {
//               print('Botón 2 presionado');
//             }),
//         _buildButton(
//             title: 'Botón 3',
//             onPressed: () {
//               print('Botón 3 presionado');
//             }),
//       ],
//     );
//   }

//   ElevatedButton _buildButton(
//       {required String title, required Function() onPressed}) {
//     return ElevatedButton(onPressed: onPressed, child: Text(title));
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DespuesRefactApp(),
//     );
//   }
// }

// class DespuesRefactApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppbar(),
//       body: _buildBody(),
//     );
//   }

//   Center _buildBody() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           _buildTitle(),
//           _buildWellcome(),
//           _buildButton(),
//         ],
//       ),
//     );
//   }

//   ElevatedButton _buildButton() {
//     return ElevatedButton(
//       onPressed: () {},
//       child: Text('Botón'),
//     );
//   }

//   Text _buildWellcome() {
//     return const Text(
//       'Bienvenido',
//       style: TextStyle(fontSize: 20.0),
//     );
//   }

//   Text _buildTitle() {
//     return const Text(
//       'Hola mundo',
//       style: TextStyle(fontSize: 30.0),
//     );
//   }

//   AppBar _buildAppbar() {
//     return AppBar(
//       title: Text('Mi App'),
//     );
//   }
// }


// class DespuesRefactApp extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: _buildAppBar(),
//         body: _buildBody(),
//       ),
//     );
//   }

//   Center _buildBody() {
//     return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Hola mundo',
//               style: TextStyle(fontSize: 30.0),
//             ),
//             Text(
//               'Bienvenido',
//               style: TextStyle(fontSize: 20.0),
//             ),
//             ElevatedButton(
//               onPressed: () {},
//               child: Text('Botón'),
//             ),
//           ],
//         ),
//       );
//   }

//   AppBar _buildAppBar() {
//     return AppBar(
//         title: Text('Mi App'),
//       );
//   }
// }