import 'package:flutter/material.dart';
import 'package:m1_s4/models/book.dart';
import 'package:m1_s4/services/books.services.dart';

class AddBook extends StatefulWidget {
  const AddBook({super.key});

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _title = '';
  String _author = '';
  int _year = 0;
  String _urlString = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Book'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) => _title = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Author'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a author';
                  }
                  return null;
                },
                onSaved: (value) => _author = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Year'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a year';
                  }
                  return null;
                },
                onSaved: (value) => _year = int.parse(value!),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Image Url'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a author';
                  }
                  return null;
                },
                onSaved: (value) => _urlString = value!,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Book book = Book(
                        title: _title,
                        author: _author,
                        year: _year,
                        imgUrl: _urlString);
                    await createBook(book);
                    Navigator.pop(context);
                  }
                },
                child: Text('Add Book'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
