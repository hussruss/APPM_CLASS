import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesPage extends StatefulWidget {
  @override
  _SharedPreferencesPageState createState() => _SharedPreferencesPageState();
}

class _SharedPreferencesPageState extends State<SharedPreferencesPage> {
  TextEditingController _controller = TextEditingController();
  String _name = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getName();
  }

  void _getName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String name = pref.getString('name') ?? '';
    setState(() {
      _name = name;
    });
  }

  void _saveName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('name', _controller.text);
    setState(() {
      _name = _controller.text;
    });
  }

  void _cleanData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('name');
    setState(() {
      _name = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared preferences Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Ingresa tu nombre'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: _saveName, child: Text('Guardar')),
            SizedBox(
              height: 20,
            ),
            Text('Nombre: $_name'),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: _cleanData, child: Text('Limpiar datos'))
          ],
        ),
      ),
    );
  }
}
