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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [ShoppingCartIcon()],
      ),
      body: FutureBuilder<List<ShoppingItem>>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            final List<ShoppingItem> list = snapshot.data;
            return GridView.builder(
              itemCount: list.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 22 / 55),
              itemBuilder: (context, index) {
                return ShoppingItemCard(
                  item: list[index],
                  onAddItem: (ShoppingItem item) {
                    ShoppingCartState.of(context)!.addItem(item);
                    print(
                        'ShoppingCart------ ${ShoppingCartState.of(context)!.shoppingCart}');
                  },
                );
              },
            );
          } else {
            return const Center(
              child: Text('No Data'),
            );
          }
        },
      ),
    );
  }
}

Future<List<ShoppingItem>> getData() async {
  const String url = 'https://fakestoreapi.com/products';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final body = jsonDecode(response.body);

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
    print('Items $items');
    return items;
  } else {
    throw Exception();
  }
}

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   int count = 0;

//   @override
//   void initState() {
//     print('Init State');
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     print('didChangeDependencies');

//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();
//   }

//   @override
//   void didUpdateWidget(covariant Home oldWidget) {
//     print('didUpdateWidget');

//     // TODO: implement didUpdateWidget
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   void dispose() {
//     print('dispose');

//     // TODO: implement dispose
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('build');

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Counter'),
//       ),
//       body: Center(
//         child: Text(
//           count.toString(),
//           style: TextStyle(fontSize: 30),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(onPressed: () {
//         setState(() {
//           print('setState');
//           count++;
//         });
//       }),
//     );
//   }
// }
