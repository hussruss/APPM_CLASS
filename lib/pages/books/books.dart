import 'package:flutter/material.dart';
import 'package:m1_s4/models/book.dart';
import 'package:m1_s4/pages/books/addBook.dart';
import 'package:m1_s4/services/books.services.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  late Future<List<Book>> futureBooks;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureBooks = fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books'),
      ),
      body: Center(
        child: FutureBuilder<List<Book>>(
          future: futureBooks,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<Book> books = snapshot.data!;
              return ListView.builder(
                itemCount: books.length,
                itemBuilder: (BuildContext context, int index) {
                  Book book = books[index];
                  return Dismissible(
                    key: Key(book.id.toString()),
                    background: Container(color: Colors.red),
                    child: ListTile(
                      leading: Image.network(book.imgUrl),
                      title: Text(book.title),
                      subtitle: Text('Autor ${book.author} Año: ${book.year}'),
                      trailing: Text(book.id.toString()),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddBook(),
            ),
          ).then((_) {
            setState(() {
              futureBooks = fetchBooks();
            });
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
