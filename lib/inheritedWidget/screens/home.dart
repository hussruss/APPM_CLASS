import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:m1_s4/inheritedWidget/state/shopping_cart.dart';
import 'package:m1_s4/inheritedWidget/widgets/shopping_cart_icon.dart';
import 'package:m1_s4/models/shopping_item.dart';
import 'package:http/http.dart' as http;
import 'package:m1_s4/widgets/shoping_cart_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Future<List<ShoppingItem>> getData() async {
  const String url = 'https://fakestoreapi.com/products';
  print('get data');
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final body = jsonDecode(response.body);
    print('get data $body');

    final List<dynamic> results = body;
    final List<ShoppingItem> items =
        results.map((e) => ShoppingItem.fromJson(e)).toList();
    // final List<ShoppingItem> items = [
    //   ShoppingItem(
    //       id: 1,
    //       title: 'Articulo 1',
    //       category: '1',
    //       description: 'Descripción',
    //       price: 199,
    //       image: 'assets/images/shorts.png')
    // ];
    return items;
  } else {
    throw Exception();
  }
}
