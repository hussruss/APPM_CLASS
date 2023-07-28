import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m1_s4/bloc/bloc/shopping_cart.dart';
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
        Positioned(left: 10, top: 10, child: Container()),
        Padding(
          padding: EdgeInsets.all(8),
          child: IconButton(
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
