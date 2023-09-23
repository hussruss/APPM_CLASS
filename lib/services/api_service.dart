import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<dynamic>> fetchPost() async {
    print('Init req');
    final response = await http.get(Uri.parse('$_baseUrl/posts'));
    print('response $response');
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception();
    }
  }
}

class TextModel {}
