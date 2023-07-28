import 'package:flutter/material.dart';
import 'package:m1_s4/inheritedWidget/state/shopping_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shoppingCartState = ShoppingCartState.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          'Shopping Cart',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: shoppingCartState!.shoppingCart.length,
              itemBuilder: (context, index) {
                final item = shoppingCartState.shoppingCart[index];
                return ListTile(
                  leading: Image.network(item.image!),
                  title: Text(item.title!),
                  subtitle: Text(
                    item.description!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Text(
                    ' \$${item.price!.toString()}.00',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                );
              },
            ),
          ),
          ListTile(
            title: Text('TOTAL:'),
            trailing: Text(
              ' \$100.00',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {}, child: Text('Pay out')))
        ],
      ),
    );
  }
}
