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
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Pop')),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.primaries[0]),
              onPressed: () {
                Navigator.pushNamed(context, '/secondRoute');
              },
              child: Text('Navegar a segunda pantalla')),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.primaries[0]),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondRoute()));
              },
              child: Text('Navegar a segunda pantalla con MaterialPage')),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.primaries[1]),
              onPressed: () {
                Navigator.pushNamed(context, '/n');
              },
              child: Text('Navegar a ruta desconocida')),
          ElevatedButton(
            child: Text('Pop y Navegar a segunda pantalla'),
            style:
                ElevatedButton.styleFrom(backgroundColor: Colors.primaries[2]),
            onPressed: () {
              Navigator.popAndPushNamed(context, '/secondRoute');
            },
          ),
          ElevatedButton(
            child: Text('Pop hasta la ruta /'),
            style:
                ElevatedButton.styleFrom(backgroundColor: Colors.primaries[3]),
            onPressed: () {
              Navigator.popUntil(context,
                  (Route<dynamic> route) => route.settings.name == '/');
            },
          ),
          ElevatedButton(
            child: Text('Navegar a segunda ruta y borrar historial'),
            style:
                ElevatedButton.styleFrom(backgroundColor: Colors.primaries[4]),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/secondRoute', (route) => false);
            },
          ),
          ElevatedButton(
            child: Text('Navegar a segunda ruta y remplazar actual'),
            style:
                ElevatedButton.styleFrom(backgroundColor: Colors.primaries[5]),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/secondRoute');
            },
          ),
          /*...Navigator.of(context).history.map((e) => ListTile(
                title: Text('${e.route.settings}'),
              ))*/
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
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Pop')),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.primaries[0]),
                onPressed: () {
                  Navigator.pushNamed(context, '/thirdRoute');
                },
                child: Text('Navegar a tercera pantalla')),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.primaries[0]),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ThirdRoute()));
                },
                child: Text('Navegar a tercera pantalla con MaterialPage')),
            ElevatedButton(
              child: Text('Se puede realizar pop?'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.primaries[5]),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        'Se puede realizar pop? ${Navigator.canPop(context)}')));
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.removeRoute(context, ModalRoute.of(context)!);
              },
              child: Text('Remove Current Route'),
            ),
            ElevatedButton(
              child: const Text('Is active'),
              onPressed: () {
                Navigator.popUntil(context, (route) {
                  print('Is Active ${route.settings.name} ${route.isActive} ');
                  return true;
                });
              },
            ),
            /*...Navigator.of(context).history.map((e) => ListTile(
                  title: Text('${e.route.settings}'),
                ))*/
          ],
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
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Pop')),
            ElevatedButton(
              child: Text('Pop hasta la ruta /navegacion'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.primaries[3]),
              onPressed: () {
                Navigator.popUntil(
                    context,
                    (Route<dynamic> route) =>
                        route.settings.name == '/navegacion');
              },
            ),
            ElevatedButton(
              child: Text('Remover segunda ruta con MaterialPage'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.primaries[5]),
              onPressed: () {
                Navigator.removeRoute(context,
                    MaterialPageRoute(builder: (context) => SecondRoute()));
              },
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.primaries[5]),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondRoute()));
                },
                child: Text('Navegar a segunda pantalla con MaterialPage')),
            ElevatedButton(
              onPressed: () {
                Navigator.removeRoute(context, ModalRoute.of(context)!);
              },
              child: Text('Remove Current Route'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.removeRouteBelow(context, ModalRoute.of(context)!);
              },
              child: Text('Remove Route Below'),
            ),
            /*...Navigator.of(context).history.map((e) => ListTile(
                  title: Text('${e.route.settings}'),
                )),*/
          ],
        ),
      ),
    );
  }
}
