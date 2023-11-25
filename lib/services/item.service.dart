import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:m1_s4/models/item.dart';

const String apiUrl = 'http://192.168.8.102:3000';

Future<List<Item>> fetchItems() async {
  final response = await http.get(Uri.parse('$apiUrl/items'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((item) => Item.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load items');
  }
}

Future<void> createItem(String name, String description) async {
  final response = await http.post(
    Uri.parse('$apiUrl/items'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({'name': name, 'description': description}),
  );

  if (response.statusCode != 201) {
    throw Exception('Failed to create item');
  }
}

Future<void> updateItem(int id, String name, String description) async {
  final response = await http.put(
    Uri.parse('$apiUrl/items/$id'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({'name': name, 'description': description}),
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to update item');
  }
}

Future<void> deleteItem(int id) async {
  final response = await http.delete(Uri.parse('$apiUrl/items/$id'));

  if (response.statusCode != 200) {
    throw Exception('Failed to delete item');
  }
}
