import 'package:flutter/material.dart';
import 'package:m1_s4/inheritedWidget/state/shopping_cart.dart';
import 'package:m1_s4/models/shopping_item.dart';
import 'package:m1_s4/provider/provider/shopping_cart.dart';
import 'package:m1_s4/provider/screens/cart.dart';
import 'package:provider/provider.dart';

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
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Center(
                child: Text(context
                    .watch<ShoppingCartStateProvider>()
                    .shoppingCart
                    .length
                    .toString()),
              ),
            )),
        Padding(
          padding: EdgeInsets.all(8),
          child: IconButton(
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return CartScreen();
                  });
            },
          ),
        ),
      ],
    );
  }
}
