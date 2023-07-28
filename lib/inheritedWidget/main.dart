import 'package:flutter/material.dart';
import 'package:m1_s4/inheritedWidget/screens/cart.dart';
import 'package:m1_s4/inheritedWidget/screens/home.dart';
import 'package:m1_s4/inheritedWidget/state/shopping_cart.dart';

class InheritedWidgetApp extends StatelessWidget {
  const InheritedWidgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShoppingCartState(
      child: MaterialApp(
          title: 'InheritedWidget App',
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => Home(),
            '/cart': (context) => CartScreen(),
          }),
    );
  }
}
