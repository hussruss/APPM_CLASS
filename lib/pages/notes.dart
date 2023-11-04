import 'package:flutter/material.dart';
import 'package:m1_s4/db/db_helper.dart';
import 'package:m1_s4/models/note.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final DatabaseHelper _databaseHelper = DatabaseHelper.intance;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Note _note = Note(id: 0, title: '', content: '');
  List<Note> _notes = [];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _loadNotes();
  }

  void _loadNotes() async {
    final notes = await _databaseHelper.getNotes();
    setState(() {
      _notes = notes;
    });
  }

  void _saveNote() async {
    _formKey.currentState!.save();
    if (_note.title.isEmpty || _note.content.isEmpty) {
      return;
    }

    await _databaseHelper.insertNotes(_note);
    _formKey.currentState!.reset();
    _loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
          itemCount: _notes.length,
          itemBuilder: (context, index) {
            final Note note = _notes[index];
            return ListTile(
              title: Text(note.title),
              subtitle: Text(note.content),
              leading: Text(note.id.toString()),
            );
          },
        )),
        Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: 'Title',
                      prefixIcon: const Icon(
                        Icons.title,
                        color: Colors.blue,
                      ),
                    ),
                    onSaved: (value) {
                      setState(() {
                        _note.title = value ?? '';
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty || value!.length < 6) {
                        return 'La contraseña debe contener más de 6 caracteres.';
                      }
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: 'content',
                      prefixIcon: const Icon(
                        Icons.description,
                        color: Colors.blue,
                      ),
                    ),
                    onSaved: (value) {
                      setState(() {
                        _note.content = value ?? '';
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty || value!.length < 6) {
                        return 'La contraseña debe contener más de 6 caracteres.';
                      }
                    },
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      _saveNote();
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        )),
                        minimumSize: MaterialStateProperty.all(
                            Size(MediaQuery.of(context).size.width * 0.8, 50))),
                    child: const Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Save note',
                        style: TextStyle(
                            color: Color.fromARGB(255, 6, 132, 216),
                            fontSize: 25),
                      ),
                    )),
                SizedBox(height: 20),
              ],
            ))
      ]),
    );
  }
}
