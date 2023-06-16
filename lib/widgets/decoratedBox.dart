import 'package:flutter/material.dart';

class DecoratedBoxWidget extends StatelessWidget {
  const DecoratedBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DecoratedBoxWidget'),
      ),
      body: Center(
        child: DecoratedBox(
          decoration: _bulidDecoration(),
          child: Container(
            width: 300,
            height: 300,
            child: const Center(
              child: FlutterLogo(
                style: FlutterLogoStyle.horizontal,
                size: 250,
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _bulidDecoration() {
    return BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(255, 3, 68, 121),
          width: 8,
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              spreadRadius: 0,
              offset: Offset(4, 4),
              blurStyle: BlurStyle.normal)
        ],
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 0, 65, 150),
          Color.fromARGB(255, 29, 97, 223),
        ], stops: [
          0.5,
          1
        ], begin: Alignment.topLeft, end: Alignment.bottomRight));
  }
}

class EjemploMaterialDeEstudio extends StatelessWidget {
  const EjemploMaterialDeEstudio({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      position: DecorationPosition.background,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        border: Border.all(
          color: const Color(0xFF000000),
          style: BorderStyle.solid,
          width: 4.0,
        ),
        borderRadius: BorderRadius.zero,
        shape: BoxShape.rectangle,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color(0x66000000),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          )
        ],
      ),
      child: Container(
        child: Container(
          width: 200,
          height: 200,
          padding: EdgeInsets.all(20),
          child: FlutterLogo(),
        ),
      ),
    );
  }
}
