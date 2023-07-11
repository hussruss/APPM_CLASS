import 'package:flutter/material.dart';

class Navegacion extends StatelessWidget {
  const Navegacion({super.key});

  @override
  Widget build(BuildContext context) {
    Navigator.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Navegación'),
      ),
      body: Column(
        children: [
          ...Navigator.of(context).history.map((e) => ListTile(
                title: Text('${e.route.settings}'),
              ))
        ],
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

class ThirdRoute extends StatefulWidget {
  const ThirdRoute({super.key});

  @override
  State<ThirdRoute> createState() => _ThirdRouteState();
}

class _ThirdRouteState extends State<ThirdRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Route'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
