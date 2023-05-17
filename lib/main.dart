import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Flexible1(),
    );
  }
}

class Flexible1 extends StatelessWidget {
  const Flexible1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: const [
        ContainerWidget(size: 200, color: Colors.red, text: '200'),
        Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: ContainerWidget(
                size: 150, color: Colors.blue, text: 'Flexible')),
        Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: ContainerWidget(
                size: 100, color: Colors.purple, text: 'Flexible')),
        Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: ContainerWidget(
                size: 100, color: Colors.orange, text: 'Flexible')),
        Expanded(
            flex: 2,
            child: ContainerWidget(
                size: 100, color: Colors.black, text: 'Expanded'))
      ]),
    );
  }
}

class GestureDetectorStack extends StatefulWidget {
  const GestureDetectorStack({super.key});

  @override
  State<GestureDetectorStack> createState() => _GestureDetectorStackState();
}

class _GestureDetectorStackState extends State<GestureDetectorStack> {
  @override
  String _gesture = 'Hello world';
  double _top = 0;
  double _left = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.expand,
        clipBehavior: Clip.hardEdge,
        children: [
          // Positioned(
          //   top: _top,
          //   left: _left,
          //   width: 200,
          //   height: 200,
          //   child: ContainerWidget(
          //       size: double.infinity,
          //       color: Color.fromARGB(255, 168, 13, 2),
          //       text: 'Red'),
          // ),
          Positioned(
            top: 300,
            left: 100,
            width: 200,
            height: 200,
            child: GestureDetector(
                onTap: () {
                  _gesture = 'onTap';
                  setState(() {});
                },
                onDoubleTap: () {
                  _gesture = 'onDoubleTap';
                  setState(() {});
                },
                onLongPress: () {
                  _gesture = 'onLongPress';
                  setState(() {});
                },
                // onHorizontalDragStart: (details) {
                //   _gesture = 'onHorizontalDragStart ${details.localPosition.dx}';
                //   setState(() {});
                // },
                // onVerticalDragStart: (details) {
                //   _gesture = 'onVerticalDragStart ${details.localPosition.dy}';
                //   setState(() {});
                // },
                onPanUpdate: (details) {
                  _gesture = 'onPanUpdate ${details.delta.dy}';
                  _top = _top + details.delta.dy;
                  _left = _left + details.delta.dx;

                  setState(() {});
                },
                child: ContainerWidget(
                    size: 200, color: Colors.green, text: _gesture)),
          ),
          Positioned(
              top: _top,
              left: _left,
              child:
                  ContainerWidget(size: 50, color: Colors.blue, text: 'Blue')),
        ],
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  final double size;
  final Color color;
  final String text;

  const ContainerWidget({
    super.key,
    required this.size,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      color: color,
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}

class WidgetStack2 extends StatelessWidget {
  const WidgetStack2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isOrientacion =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Material(
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.3), BlendMode.overlay),
                    image: const AssetImage('assets/images/bg.jpg'),
                    fit: BoxFit.cover)),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/login.png',
                            width: 180, height: 180),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Bienvenido',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(),
                  textFieldCustom('Usuario', isOrientacion),
                  const SizedBox(
                    height: 20,
                  ),
                  textFieldCustom('Contraseña', isOrientacion),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: (isOrientacion == true) ? 20 : 150,
                        right: (isOrientacion == true) ? 20 : 150),
                    child: SizedBox(
                        width: double.infinity, // <-- Your width
                        height: 70, // <-- Your height
                        child: ElevatedButton(
                          child: const Text('Ingresar',
                              style: TextStyle(fontSize: 20.0)),
                          onPressed: () {},
                        )),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget textFieldCustom(String hintext, bool isOrientacion) {
    return Container(
      height: 70,
      width: double.infinity,
      padding: EdgeInsets.only(
          left: (isOrientacion == true) ? 20 : 150,
          right: (isOrientacion == true) ? 20 : 150),
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          hintText: hintext,
        ),
      ),
    );
  }
}

class WidgetStack3 extends StatelessWidget {
  const WidgetStack3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CachedNetworkImage(
          imageUrl:
              'https://www.blogdelfotografo.com/wp-content/uploads/2020/04/fotografo-paisajes.jpg',
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.darken)),
            ),
          ),
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: Container(
            alignment: Alignment.bottomCenter,
            child: const Text(
              'Google',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Stack(
            children: [
              Card(
                margin: const EdgeInsets.only(
                  top: 80.0,
                  left: 30.0,
                  right: 30.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 60.0,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Sergey Brin'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                            'Es un empresario e informático teórico estadounidense de origen ruso que junto a Larry Page, fundó Google'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Biografía'),
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(
                  left: 108.0,
                  top: -0.0,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Sergey_Brin_Ted_2010.jpg/270px-Sergey_Brin_Ted_2010.jpg'),
                  )),
            ],
          ),
        )
      ],
    );
  }
}

// Es una clase este widget de tipo StatefulWidget, que se describira más adelante
class GestureExample1 extends StatefulWidget {
  //Constructor de la clase
  const GestureExample1({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<GestureExample1> createState() => _GestureExample1State();
}

// La clase donde se va a implementar el State o estado del widget
class _GestureExample1State extends State<GestureExample1> {
  int _counter = 0;

  // Método o función para incrementar el contador
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // Método o función para decrementar el contador
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  // variable de tipo String que trae su valor una url
  String urlImage = 'assets/images/ls1.jpeg';

  //Método encargado de colocar todos los widgets para que pueda aparecer en nuestra vista
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Se utiliza el widget Scaffold para dar la estructura a nuestra aplicación
      appBar: AppBar(
        // Se declara el widget AppBar que representa la barra superior de la aplicación
        title: Text(widget.title), // Widget de tipo Text
      ),
      body: Center(
        // Widget para centrar el contenido de los widgets
        child: Column(
          // Widget column para añadir elementos visuales o widgets de manera en fila
          mainAxisAlignment: MainAxisAlignment
              .center, // Alineamiento de los widgets en el centro
          children: <Widget>[
            //Propiedad children para añadir más widgets
            const Text(
              // Widget de tipo Text
              'You have pushed the button this many times:',
            ),
            GestureDetector(
              // El uso del widget no visible pero si funcional GestureDetector
              onTap:
                  _incrementCounter, // Cuando se le de tap o clic en el objeto que lo referencie
              onDoubleTap:
                  _decrementCounter, // Cuando se le de  doble tap o clic en el objeto que lo referencie
              onHorizontalDragUpdate: (details) {
                // Cuando uno se desplace hacia al lado izquiero o derecho con el dedo  en el elemento que lo relaciona
                if (details.delta.dx > 0) {
                  print("right");
                  _incrementCounter();
                } else {
                  print("left");
                  _decrementCounter();
                }
              },
              child: Text(
                // Widget de tipo Text que esta unido con el GestureDetector
                '$_counter',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            GestureDetector(

                // El uso del widget no visible pero si funcional GestureDetector
                onVerticalDragUpdate: (details) {
                  // Cuando detecte que la imagen se le aplica un gesto de manera vertical
                  if (details.delta.dy > 0) {
                    print("down");
                    setState(() {
                      urlImage = 'assets/images/ls2.jpg';
                    });
                  } else {
                    print("up");
                    setState(() {
                      urlImage = 'assets/images/ls3.jpg';
                    });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(urlImage),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Widget floatingActionButton
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
