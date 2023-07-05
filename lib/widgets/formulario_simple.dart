import 'package:flutter/material.dart';

class FormularioSimple extends StatefulWidget {
  const FormularioSimple({super.key});

  @override
  State<FormularioSimple> createState() => _FormularioSimpleState();
}

class _FormularioSimpleState extends State<FormularioSimple> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  String _name = '';
  String _email = '';
  bool? _sabesProgramar = false;
  bool _aprenderFlutter = false;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _key = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario simple'),
      ),
      body: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Text('Formulario'),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                      label: Text('Ingresa tu nombre')),
                  onChanged: (value) {
                    print('Nombre : $value');
                    setState(() {
                      _name = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        suffixIcon: Icon(Icons.email),
                        label: Text('Ingresa tu correo')),
                    onChanged: (value) {
                      print('Email : $value');
                      setState(() {
                        _email = value;
                      });
                    }),
                SizedBox(
                  height: 30,
                ),
                Divider(),
                Text('Sabes programación?'),
                RadioListTile(
                    title: Text('Si'),
                    value: true,
                    groupValue: _sabesProgramar,
                    onChanged: (value) {
                      setState(() {
                        _sabesProgramar = value;
                      });
                    }),
                RadioListTile(
                    title: Text('No'),
                    value: false,
                    groupValue: _sabesProgramar,
                    onChanged: (value) {
                      setState(() {
                        _sabesProgramar = value;
                      });
                    }),
                SizedBox(
                  height: 30,
                ),
                Text('Quieres aprender Flutter?'),
                Divider(),
                Switch(
                    value: _aprenderFlutter,
                    onChanged: (value) {
                      setState(() {
                        _aprenderFlutter = value;
                      });
                    }),
                ElevatedButton(
                    onPressed: () {
                      print('Save form');
                      print(
                          'Name  ${_name}, Email : $_email, Programar: $_sabesProgramar, Aprender Flutter $_aprenderFlutter');
                    },
                    child: Text('Guardar'))
              ],
            ),
          )),
    );
  }
}
