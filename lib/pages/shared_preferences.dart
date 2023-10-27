import 'package:flutter/material.dart';

class SharedPreferencesPage extends StatefulWidget {
  @override
  _SharedPreferencesPageState createState() => _SharedPreferencesPageState();
}

class _SharedPreferencesPageState extends State<SharedPreferencesPage> {
  TextEditingController _nameController = TextEditingController();
  String _savedName = '';

  @override
  void initState() {
    super.initState();
    _loadSavedName();
  }

  void _loadSavedName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedName = prefs.getString('name') ?? '';
    setState(() {
      _savedName = savedName;
    });
  }

  void _saveName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _nameController.text);
    setState(() {
      _savedName = _nameController.text;
    });
    _nameController.clear();
  }

  void _clearName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('name');
    setState(() {
      _savedName = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences Demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Ingresa tu nombre',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveName,
              child: Text('Guardar nombre'),
            ),
            SizedBox(height: 16.0),
            Text('Nombre guardado: $_savedName'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _clearName,
              child: Text('Limpiar nombre'),
            ),
          ],
        ),
      ),
    );
  }
}
