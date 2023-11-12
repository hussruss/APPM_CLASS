import 'package:http/http.dart' as http;
import 'package:m1_s4/models/book.dart';
import 'dart:convert';
import 'package:m1_s4/models/item.dart';

const String apiUrl = 'http://192.168.8.102:3000';

Future<List<Book>> fetchBooks() async {
  final response = await http.get(Uri.parse('$apiUrl/books'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((e) => Book.fromJson(e)).toList();
  } else {
    throw Exception('Faild to load books');
  }
}

Future<void> createBook(Book book) async {
  final response = await http.post(
    Uri.parse('$apiUrl/books'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({
      'title': book.title,
      'author': book.author,
      'year': book.year,
      'imgUrl': book.imgUrl
    }),
  );

  if (response.statusCode != 201) {
    throw Exception('Failed to create item');
  }
}
