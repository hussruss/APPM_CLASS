import 'package:flutter/material.dart';

class FormularioSimple extends StatefulWidget {
  const FormularioSimple({super.key});

  @override
  State<FormularioSimple> createState() => _FormularioSimpleState();
}

class _FormularioSimpleState extends State<FormularioSimple> {
  TextEditingController _userController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  String? sabesProgramar; //Variable declarado para su uso en uno de los widgets

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario simple'),
      ),
    );
  }
}
