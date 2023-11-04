import 'package:flutter/material.dart';
import 'package:m1_s4/models/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper intance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  //Getter db
  Future<Database> get database async {
    _database ??= await _intiDB();
    return _database!;
  }

  //Inicializar base de datos
  Future<Database> _intiDB() async {
    final String dbPath = await getDatabasesPath();
    final String path = join(dbPath, 'notes.db');
    return await openDatabase(path, version: 1, onCreate: _onCreateDB);
  }

  //Creando base de datos
  Future<void> _onCreateDB(Database db, int versio) async {
    await db.execute('''
      CREATE TABLE notes(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        content TEXT
      )
    ''');
  }

  //Get notes
  Future<List<Note>> getNotes() async {
    final Database db = await intance.database;
    final List<Map<String, dynamic>> maps = await db.query('notes');
    return List.generate(maps.length, (index) => Note.fromMap(maps[index]));
  }

  //insert not
  Future<int> insertNotes(Note note) async {
    final Database db = await intance.database;
    return await db.insert('notes', note.toMap());
  }
}
