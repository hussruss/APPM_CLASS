import 'package:flutter/material.dart';
import 'package:m1_s4/inheritedWidget/state/shopping_cart.dart';
import 'package:m1_s4/models/shopping_item.dart';

class ShoppingCartIcon extends StatelessWidget {
  const ShoppingCartIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print('build ShoppingCartIcon ');
    return Stack(
      children: [
        Positioned(
            left: 10,
            top: 10,
            child: ValueListenableBuilder<List<ShoppingItem>>(
                valueListenable:
                    ShoppingCartState.of(context)!.shoppingCartListener,
                builder: (context, cart, child) {
                  print('ValueListenableBuilder ShoppingCartIcon ');
                  return Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Center(
                      child: Text(cart.length.toString()),
                    ),
                  );
                })),
        Padding(
          padding: EdgeInsets.all(8),
          child: IconButton(
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/cart');
            },
          ),
        ),
      ],
    );
  }
}
